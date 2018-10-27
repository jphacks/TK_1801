<?php
class Mypage extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		session_start();
	}

	function index()
	{
		$this->smarty->view('mypage.tpl', array(
			'user' => isset($_SESSION['user_id']) ? $this->user->get('*', array('id' => $_SESSION['user_id'])) : null,
		));
	}
}
