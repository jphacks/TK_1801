<?php
class Home extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	function index()
	{
		$this->smarty->view('home.tpl');
	}
}