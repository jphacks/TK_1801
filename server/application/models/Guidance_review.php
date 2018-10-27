<?php
class Guidance_review extends CI_Model {

	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	/**
	 * レビューの件数を取得
	 *
	 * @param array 検索条件
	 * @return int レビューの件数
	 */
	public function count($wheres = array()) {
		$this->db->from('guidance_reviews');
		$this->db->where($wheres);
		return $this->db->count_all_results();
	}

	/**
	 * レビューを1件取得
	 *
	 * @param string 取得カラム(カンマ区切り, エスケープしないのでレビューからの入力は直接入れないこと)
	 * @param array 検索条件
	 * @param string ソート対象のカラム名
	 * @param string ソート順序(ASC/DESC)
	 * @param int 取得開始位置
	 * @return array|bool レビュー情報(見つからなかった場合はfalseが返る)
	 */
	public function get($select = '*', $wheres, $order_by = null, $sort_order = 'ASC', $offset = null) {
		$guidance_reviews = $this->search($select, $wheres, $order_by, $sort_order, 1, $offset);
		if (!isset($guidance_reviews[0])) {
			return false;
		}
		return $guidance_reviews[0];
	}

	/**
	 * レビューを検索
	 *
	 * @param string 取得カラム(カンマ区切り, エスケープしないのでレビューからの入力は直接入れないこと)
	 * @param array 検索条件の連想配列
	 * @param string ソート対象のカラム名
	 * @param string ソート順序(ASC/DESC)
	 * @param int 取得するデータ数
	 * @param int 取得開始位置
	 * @return array レビュー情報の配列
	 */
	public function search($select = '*', $wheres = array(), $order_by = null, $sort_order = 'ASC', $limit = null, $offset = null) {
		$this->db->select($select, false);
		$this->db->from('guidance_reviews');
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
	 * レビューを登録
	 *
	 * @param array 登録するレビュー情報
	 * @return bool 成功時は登録されたレビューのid, 失敗時はfalseが返る
	 */
	public function register($values) {
		return $this->db->insert('guidance_reviews', $values) ? $this->db->insert_id() : false;
	}

	/**
	 * レビューを更新
	 *
	 * @param array 更新条件
	 * @param array 更新するレビュー情報
	 * @return bool 成功時はtrue, 失敗時はfalseが返る
	 */
	public function update($wheres, $values) {
		$this->db->where($wheres);
		return $this->db->update('guidance_reviews', $values);
	}

	/**
	 * レビューを削除
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
		$this->db->delete('guidance_reviews');

		return true;
	}

}
