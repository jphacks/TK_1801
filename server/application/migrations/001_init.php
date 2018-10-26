<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Init extends CI_Migration {

	public function up()
	{
        $sql = <<<'EOS'
        CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            name TEXT NOT NULL,
            type TEXT NOT NULL CHECK(type IN ('customer', 'guide')),
            balance INTEGER NOT NULL DEFAULT 0, -- ポイント残高
            password_hash TEXT NOT NULL,
            created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            created_by_ip_address INTEGER NOT NULL
        );
        
        CREATE TABLE customer_users (
            user_id INTEGER NOT NULL,
            country TEXT NOT NULL -- 出身国(「USA」などの自己申告制のテキスト)
        );
        
        CREATE TABLE guide_users (
            user_id INTEGER NOT NULL,
            location TEXT NOT NULL -- 居住地(「東京都新宿区」などの自己申告制のテキスト)
        );
        
        CREATE TABLE calls (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            customer_user_id INTEGER NOT NULL,
            guide_user_id INTEGER NOT NULL,
            status TEXT NOT NULL CHECK(status IN ('waiting', 'active', 'completed', 'cancelled')),
            paied_point INTEGER,
            created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            completed_at DATETIME,
            created_by_ip_address INTEGER NOT NULL
        );
        
        CREATE TABLE call_reviews (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            star INTEGER NOT NULL CHECK(star >= 1 OR star <= 5),
            body TEXT NOT NULL, -- 本文
            created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            created_by_ip_address INTEGER NOT NULL
        );
EOS;
        $this->db->query($sql);
	}

	public function down()
	{
        $tables = array(
            'users',
            'customer_users',
            'guide_users',
            'calls',
            'call_reviews',
        );
        foreach ($tables as $table) {
            $this->dbforge->drop_table($table);
        }
	}

}