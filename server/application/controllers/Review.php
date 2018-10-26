<?php
class Review extends CI_Controller {

	function __construct()
	{
		parent::__construct();
	}

	function index()
	{
		$this->smarty->view('review.tpl');
	}
}
