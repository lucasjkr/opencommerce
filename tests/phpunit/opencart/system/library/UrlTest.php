<?php

class UrlTest extends OpenCartTest {

	public function testHomeUrl() {
		$link = $this->url->link('common/home');
		$this->assertEquals("https://" . STORE_URL . 'index.php?route=common/home', $link, "Could not construct homepage's URL");
	}

	public function testSecureHomeUrl() {
		$link = $this->url->link('common/home', '', true);
		$this->assertEquals("https://" . STORE_URL . 'index.php?route=common/home', $link, "Could not construct secure homepage's URL");
	}

	public function testProductUrl() {
		$link = $this->url->link('product/product', 'product_id=1');
		$this->assertEquals("https://" . STORE_URL . 'index.php?route=product/product&amp;product_id=1', $link, "Could not construct product's URL");
	}

	public function testSecureProductUrl() {
		$link = $this->url->link('product/product', 'product_id=1');
		$this->assertEquals("https://" . STORE_URL . 'index.php?route=product/product&amp;product_id=1', $link, "Could not construct product's URL");
	}

	public function testProductUrlRewrite() {
		$this->db->query("INSERT INTO `oc_url_alias` SET query = 'product_id=1', keyword = 'product-1'");
		$this->config->set('config_seo_url', 1);
		$urlAction = new Action('common/seo_url');
		$urlAction->execute($this->registry);

		$link = $this->url->link('product/product', 'product_id=1');
		$this->db->query("DELETE FROM `oc_url_alias` WHERE query = 'product_id=1'");
		$this->assertEquals("https://" . STORE_URL . 'product-1', $link, "Could not construct URL's alias");
	}

}
