<?php
class Register extends CI_Controller {

	function __construct()
	{
		parent::__construct();

		$this->load->database();
		
		session_start();
	}

	function index()
	{
		$this->smarty->view('register.tpl');
	}

	function submit()
	{
		// フォーム検証ライブラリの読み込み
		$this->load->library('form_validation');

		/* サイト全体を英語に変更することになったためコメントアウト
		$this->form_validation->set_message('required', '{field}が入力されていません。');
		$this->form_validation->set_message('valid_email', '{field}が有効ではありません。');
		$this->form_validation->set_message('min_length', '{field}が短すぎます。{param}文字以上で指定してください。');
		$this->form_validation->set_message('max_length', '{field}が長すぎます。{param}文字以内で指定してください。');
		$this->form_validation->set_message('greater_than_equal_to', '{field}は{param}以上である必要があります。');
		$this->form_validation->set_message('less_than_equal_to', '{field}は{param}以下である必要があります。');
		$this->form_validation->set_message('is_natural_no_zero', '{field}の指定が不正です。');*/

		$rules = array(
			array(
				'field' => 'name',
				'label' => 'Name',
				'rules' => 'required|min_length[1]|max_length[150]',
			),
			array(
				'field' => 'email_address',
				'label' => 'Email Address',
				'rules' => 'required|valid_email|is_unique[users.email_address]',
			),
			array(
				'field' => 'password',
				'label' => 'Password',
				'rules' => 'required|min_length[6]|max_length[32]',
			),
			array(
				'field' => 'type',
				'label' => 'Account Type',
				'rules' => 'required|in_list[tourist,guide]',
			),
			array(
				'field' => 'location',
				'label' => 'Location',
				'rules' => 'required|min_length[1]|max_length[150]',
			),
		);
		$this->form_validation->set_rules($rules);
		$data = array(
			'name' => $this->input->post('name'),
			'type' => $this->input->post('type'),
			'email_address' => $this->input->post('email_address'),
			'password_hash' => password_hash($this->input->post('password'), PASSWORD_BCRYPT),
			'location' => $this->input->post('location'),
			'created_by_ip_address' => ip2long($_SERVER['REMOTE_ADDR']),
		);
		$error_message = null;
		if ($this->form_validation->run() === false) {
			// フォーム検証エラー
			$error_message = $this->form_validation->error_string();
		} else {
			$user_id = $this->user->register($data);
			if ($user_id === false) {
				// DBエラー
				$error_message = 'Failed to register the user data.';
			} else {
				// ユーザーの登録に成功
				$_SESSION['user_id'] = $user_id;
				redirect('/mypage');
			}
		}
		$data['error_message'] = $error_message;
		$data['user'] = isset($_SESSION['user_id']) ? $this->user->get('*', array('id' => $_SESSION['user_id'])) : null;
		$this->smarty->view('register.tpl', $data);
	}
}
