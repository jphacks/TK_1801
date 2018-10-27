<?php
class Login extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		session_start();
	}

	function index()
	{
		// ログイン試行
		$error_message = null;
		if ($this->input->post('email_address')) {
			$user = $this->user->get('id, password_hash', array('email_address' => $this->input->post('email_address')));
			if ($user === false || !password_verify($this->input->post('password'), $user['password_hash'])) {
				$error_message = 'Incorrect email address or password.';
			} else {
				// ログイン成功
				$_SESSION['user_id'] = $user['id'];
				redirect('/mypage');
			}
		}
		$this->smarty->view('login.tpl', array(
			'user' => isset($_SESSION['user_id']) ? $this->user->get('*', array('id' => $_SESSION['user_id'])) : null,
			'email_address' => $this->input->post('email_address'),
			'error_message' => $error_message,
		));
	}
}
