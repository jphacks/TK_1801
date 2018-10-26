<?php
class Call extends CI_Model {

	function __construct()
	{
		parent::__construct();
	}

	/**
	 * ガイド呼び出しの件数を取得
	 *
	 * @param array 検索条件
	 * @return int ガイド呼び出しの件数
	 */
	public function count($wheres = array()) {
		$this->db->from('calls');
		$this->db->where($wheres);
		return $this->db->count_all_results();
	}

	/**
	 * ガイド呼び出しを1件取得
	 *
	 * @param string 取得カラム(カンマ区切り, エスケープしないのでガイド呼び出しからの入力は直接入れないこと)
	 * @param array 検索条件
	 * @param string ソート対象のカラム名
	 * @param string ソート順序(ASC/DESC)
	 * @param int 取得開始位置
	 * @return array|bool ガイド呼び出し情報(見つからなかった場合はfalseが返る)
	 */
	public function get($select = '*', $wheres, $order_by = null, $sort_order = 'ASC', $offset = null) {
		$calls = $this->search($select, $wheres, $order_by, $sort_order, 1, $offset);
		if (!isset($calls[0])) {
			return false;
		}
		return $calls[0];
	}

	/**
	 * ガイド呼び出しを検索
	 *
	 * @param string 取得カラム(カンマ区切り, エスケープしないのでガイド呼び出しからの入力は直接入れないこと)
	 * @param array 検索条件の連想配列
	 * @param string ソート対象のカラム名
	 * @param string ソート順序(ASC/DESC)
	 * @param int 取得するデータ数
	 * @param int 取得開始位置
	 * @return array ガイド呼び出し情報の配列
	 */
	public function search($select = '*', $wheres = array(), $order_by = null, $sort_order = 'ASC', $limit = null, $offset = null) {
		$this->db->select($select, false);
		$this->db->from('calls');
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
	 * ガイド呼び出しを登録
	 *
	 * @param array 登録するガイド呼び出し情報
	 * @return bool 成功時は登録されたガイド呼び出しのid, 失敗時はfalseが返る
	 */
	public function register($values) {
		return $this->db->insert('calls', $values) ? $this->db->insert_id() : false;
	}

	/**
	 * ガイド呼び出しを更新
	 *
	 * @param array 更新条件
	 * @param array 更新するガイド呼び出し情報
	 * @return bool 成功時はtrue, 失敗時はfalseが返る
	 */
	public function update($wheres, $values) {
		$this->db->where($wheres);
		return $this->db->update('calls', $values);
	}

	/**
	 * ガイド呼び出しを削除
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
		$this->db->delete('calls');

		return true;
	}

}
