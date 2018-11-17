<?php
class Setting extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		session_start();
	}

	function index()
	{
		$this->smarty->view('setting.tpl', array(
			'user' => $this->user->get('*', array('id' => $_SESSION['user_id'])),
		));
	}

	function submit()
	{
		// フォーム検証ライブラリの読み込み
		$this->load->library('form_validation');

		$rules = array(
			array(
				'field' => 'name',
				'label' => 'Name',
				'rules' => 'min_length[1]|max_length[150]',
			),
			array(
				'field' => 'email_address',
				'label' => 'Email Address',
				'rules' => 'valid_email|is_unique[users.email_address]',
			),
			array(
				'field' => 'password',
				'label' => 'Password',
				'rules' => 'min_length[6]|max_length[32]',
			),
			array(
				'field' => 'type',
				'label' => 'Account Type',
				'rules' => 'min_list[tourist,guide]',
			),
			array(
				'field' => 'location',
				'label' => 'Location',
				'rules' => 'min_length[1]|max_length[150]',
			),
		);
		$this->form_validation->set_rules($rules);

		// 更新するユーザー情報
		// (POSTをそのままDB更新に利用すると意図しないカラムが指定された場合に危険なため個別に指定)
		$updates = array(
			'name' => $this->input->post('name'),
			'type' => $this->input->post('type'),
			'email_address' => $this->input->post('email_address'),
			'password_hash' =>
				($this->input->post('password') === null) ? null :
				password_hash($this->input->post('password'), PASSWORD_BCRYPT),
			'location' => $this->input->post('location'),
		);

		// 値がnullの要素を配列から削除
		$updates = array_filter($updates, function($value, $key) {
			return isset($value);
		}, ARRAY_FILTER_USE_BOTH);

		$error_message = null;
		if ($this->form_validation->run() === false) {
			// フォーム検証エラー
			$error_message = $this->form_validation->error_string();
		} else {
			$success = $this->user->update(array('id' => $_SESSION['user_id']), $updates);
			if ($success === false) {
				// DBエラー
				$error_message = 'Failed to update your information.';
			} else {
				// ユーザー情報の更新に成功
				redirect('/mypage');
			}
		}

		$data = array(
			'user' => $this->user->get('*', array('id' => $_SESSION['user_id'])),
			'error_message' => $error_message,
		);
		$this->smarty->view('setting.tpl', $data);
	}

	function upload_image()
	{
		// ファイルアップロードライブラリの読み込み
		$upload_path = './application/uploads/';
		$this->load->library('upload', array(
			'upload_path' => $upload_path,
			'allowed_types' => 'jpg',
			'max_size' => 2048/*KB*/,
			'max_width' => 1024,
			'max_height' => 768,
			'encrypt_name' => true,
		));

		$user = $this->user->get('profile_image_filename', array('id' => $_SESSION['user_id']));
		$old_filename = $user['profile_image_filename'];

		if($this->upload->do_upload('image')){
			$success = $this->user->update(array('id' => $_SESSION['user_id']), array(
				'profile_image_filename' => $upload_path.$this->upload->data('file_name'),
			));
			if ($success === false) {
				// DBエラー
				$error_message = 'Failed to update your information.';
				@unlink($upload_path.$this->upload->data('file_name'));
			} else {
				/*
				// 画像のリサイズ
				$this->load->library('image_lib', array(
					'image_library' => 'imagemagick',
					'source_image' => $this->upload->data('full_path'),
					'create_thumb' => true,
					'maintain_ratio' => true,
					'width' => 400,
					'height' => 400,
				));
				$this->image_lib->resize();
				*/
				@unlink($old_filename);

				// ユーザー情報の更新に成功
				redirect('/mypage');
			}
		} else {
			// ファイルアップロードエラー
			$error_message = $this->upload->display_errors();
		}

		$data = array(
			'user' => $this->user->get('*', array('id' => $_SESSION['user_id'])),
			'error_message' => $error_message,
		);
		$this->smarty->view('setting.tpl', $data);
	}
}