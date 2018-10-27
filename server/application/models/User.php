<?php
class User extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}

	/**
	 * ユーザーの件数を取得
	 *
	 * @param array 検索条件
	 * @return int ユーザーの件数
	 */
	public function count($wheres = array()) {
		$this->db->from('users');
		$this->db->where($wheres);
		return $this->db->count_all_results();
	}

	/**
	 * ユーザーを1件取得
	 *
	 * @param string 取得カラム(カンマ区切り, エスケープしないのでユーザーからの入力は直接入れないこと)
	 * @param array 検索条件
	 * @param string ソート対象のカラム名
	 * @param string ソート順序(ASC/DESC)
	 * @param int 取得開始位置
	 * @return array|bool ユーザー情報(見つからなかった場合はfalseが返る)
	 */
	public function get($select = '*', $wheres, $order_by = null, $sort_order = 'ASC', $offset = null) {
		$users = $this->search($select, $wheres, $order_by, $sort_order, 1, $offset);
		if (!isset($users[0])) {
			return false;
		}
		return $users[0];
	}

	/**
	 * ユーザーを検索
	 *
	 * @param string 取得カラム(カンマ区切り, エスケープしないのでユーザーからの入力は直接入れないこと)
	 * @param array 検索条件の連想配列
	 * @param string ソート対象のカラム名
	 * @param string ソート順序(ASC/DESC)
	 * @param int 取得するデータ数
	 * @param int 取得開始位置
	 * @return array ユーザー情報の配列
	 */
	public function search($select = '*', $wheres = array(), $order_by = null, $sort_order = 'ASC', $limit = null, $offset = null) {
		$this->db->select($select, false);
		$this->db->from('users');
		$this->db->where($wheres);
		if ($order_by) {
			$this->db->order_by($order_by, $sort_order);
		}
		if ($limit !== null) {
			if ($offset !== null) {
				$this->db->limit($limit, $offset);
			}else{
				$this->db->limit($limit);
			}
		}
		$query = $this->db->get();

		return $query->result_array();
	}

	/**
	 * ユーザーを登録
	 *
	 * @param array 登録するユーザー情報
	 * @return bool 成功時は登録されたユーザーのid, 失敗時はfalseが返る
	 */
	public function register($values) {
		return $this->db->insert('users', $values) ? $this->db->insert_id() : false;
	}

	/**
	 * ユーザーを更新
	 *
	 * @param array 更新条件
	 * @param array 更新するユーザー情報
	 * @return bool 成功時はtrue, 失敗時はfalseが返る
	 */
	public function update($wheres, $values) {
		$this->db->where($wheres);
		return $this->db->update('users', $values);
	}

	/**
	 * ユーザーを削除
	 *
	 * @param array 削除条件
	 * @return bool 成功時はtrue, 失敗時はfalseが返る
	 */
	public function delete($wheres) {
		if (empty($wheres)) {
			// 安全のため全件削除を禁止
			return false;
		}

		$this->db->where($wheres);
		$this->db->delete('users');

		return true;
	}

}
