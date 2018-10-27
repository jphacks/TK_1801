<?php
class Mypage extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	function index()
	{
		$this->smarty->view('mypage.tpl');
	}
}
