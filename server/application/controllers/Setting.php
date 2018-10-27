<?php
class Setting extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		session_start();
	}

	function index()
	{
		$this->smarty->view('setting.tpl');
	}
}