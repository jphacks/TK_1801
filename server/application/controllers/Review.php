<?php
class Review extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		session_start();
		
		if (!isset($_SESSION['user_id'])) {
			redirect('/login');
		}
		
		$guidance = $this->guidance->get('*', array('guidance_id' => $data['guidance_id']));
		if ($guidance === false || $guidance['tourist_user_id'] !== $_SESSION['user_id']) {
			$data = array(
				'error_message_only' => 'You don\'t have rights for posting reviews of this guidance.',
			);
			$this->smarty->view('review.tpl', $data);
		}
	}

	function index()
	{
		$this->smarty->view('review.tpl', array(
			'user' => isset($_SESSION['user_id']) ? $this->user->get('*', array('id' => $_SESSION['user_id'])) : null,
			'guidance_id' => $this->input->get('id'),
		));
	}

	function submit()
	{
		// フォーム検証ライブラリの読み込み
		$this->load->library('form_validation');
		$rules = array(
			array(
				'field' => 'guidance_id',
				'label' => 'Guidance ID',
				'rules' => 'required|is_natural_no_zero',
			),
			array(
				'field' => 'body',
				'label' => 'Comment',
				'rules' => 'required|max_length[500]',
			),
			array(
				'field' => 'star',
				'label' => 'Star',
				'rules' => 'required|is_natural_no_zero|less_than_equal_to[5]',
			),
		);
		$this->form_validation->set_rules($rules);
		$data = array(
			'guidance_id' => $this->input->get('id'),
			'body' => $this->input->post('body'),
			'star' => $this->input->post('star'),
			'created_by_ip_address' => ip2long($_SERVER['REMOTE_ADDR']),
		);
		$error_message = null;
		if ($this->form_validation->run() === false || isset($error_message)) {
			// フォーム検証エラー
			$error_message = $this->form_validation->error_string();
		} else {
			$review_id = $this->guidance_review->register($data);
			if ($review_id === false) {
				// DBエラー
				$error_message = 'Failed to register the requestted review.';
			} else {
				// 評価の投稿に成功
				redirect('/mypage');
			}
		}
		$data['error_message'] = $error_message;
		$data['user'] = isset($_SESSION['user_id']) ? $this->user->get('*', array('id' => $_SESSION['user_id'])) : null;
		$this->smarty->view('review.tpl', $data);
	}
}
