<?php
class Mypage extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		session_start();
	}

	function index()
	{
		if (!isset($_SESSION['user_id']) || ($this->user->count(array('id' => $_SESSION['user_id'])) === 0)) {
			redirect('/login');
		} else {
			$this->smarty->view('map.tpl', array(
				'user' => $this->user->get('*', array('id' => $_SESSION['user_id'])),
			));
		}
	}
}
