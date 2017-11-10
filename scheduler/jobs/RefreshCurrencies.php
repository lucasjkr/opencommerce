<?php
namespace CronJobs;

class RefreshCurrencies extends \Controller {
    public $name = 'RefreshCurrencies';

    public $interval = 'day';

    public function run(){
        $query = $this->db->query("SELECT * FROM oc_currency WHERE code != :code AND date_modified < timestampadd(hour, -24, now())",
            [
                ':code' => 'USD'
            ]);

        if($query->num_rows == 0) {
            return "Already up-to-date";
        }

        // Load the sites settings to find out what the default currency is.
        $this->load->model('setting/setting');
        $base_currency = $this->model_setting_setting->getSettingValue('config_currency');

        $zip = new \ZipArchive();
        $ecb_source_url = 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref.zip';
        $path_to_zip = DIR_STORAGE . 'download/ecb-data.zip';
        $path_to_csv = DIR_STORAGE . 'download/eurofxref.csv';

        $compressed = file_get_contents($ecb_source_url);
        file_put_contents($path_to_zip, $compressed);

        $res = $zip->open($path_to_zip);

        if($res === TRUE) {

            $zip->extractTo(DIR_STORAGE . 'download/');
            $zip->close();
            $data = file_get_contents($path_to_csv);

            $explode = explode(PHP_EOL, $data);
            $currencies = explode(', ', $explode[0]);
            $values = explode(', ', $explode[1]);

            // Combine currencies and values into a single array
            $combined = array_combine($currencies, $values);

            // Since we're getting values from the European Central Bank and their base currency is the Euro,
            // the Euro should always be present in our array with a value of 1 initially
            $combined['EUR'] = 1;

            // Set the value of the base currrency relative to the Euro, so we can convert the rest of the currencies
            // in the next step.
            $base = $combined[$base_currency];

            // Now we need to convert the currency values from being relative to the Euro to being relative to our base
            // currency:
            $normalized = [];
            foreach ($combined as $key => $value){
                // ECB data often has a trailing comma, which creates an array key with no name or value.
                // This if check is done to drop that value
                if(!is_null($value) && $value != ''){
                    $normalized[$key] = $value / $base;
                }
            }

            // Finally, we need to update the currency table with the new values
            $i = 0;
            foreach($query->rows as $row){
                $this->db->query("UPDATE oc_currency SET value = :value WHERE code = :code",
                    [
                        ':value' => $normalized[$row['code']],
                        ':code' => $row['code'],
                    ]
                );
                $i++;
            }

            // cleanup - delete the files we just downloaded
            unlink(DIR_STORAGE . 'download/ecb-data.zip');
            unlink(DIR_STORAGE . 'download/eurofxref.csv');


            return "Updated $i currencies";
        }
    }
}