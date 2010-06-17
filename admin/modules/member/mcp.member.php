<?php

/*
=====================================================
 ExpressionEngine - by EllisLab
-----------------------------------------------------
 http://expressionengine.com/
-----------------------------------------------------
 Copyright (c) 2003 - 2008 EllisLab, Inc.
=====================================================
 THIS IS COPYRIGHTED SOFTWARE
 PLEASE READ THE LICENSE AGREEMENT
 http://expressionengine.com/docs/license.html
=====================================================
 File: mcp.member.php
-----------------------------------------------------
 Purpose: Member management system - CP
 Note: Because member management is so tightly
 integrated into the core system, most of the 
 member functions are contained in the core and cp
 files.
=====================================================
*/

if ( ! defined('EXT'))
{
    exit('Invalid file request');
}


class Member_CP {

    var $version = '1.3';
    



    /** --------------------------------
    /**  Module installer
    /** --------------------------------*/

    function member_module_install()
    {
        global $DB;        
        
        $sql[] = "INSERT INTO exp_modules (module_id, module_name, module_version, has_cp_backend) VALUES ('', 'Member', '$this->version', 'n')";
        $sql[] = "INSERT INTO exp_actions (action_id, class, method) VALUES ('', 'Member', 'registration_form')";
        $sql[] = "INSERT INTO exp_actions (action_id, class, method) VALUES ('', 'Member', 'register_member')";
        $sql[] = "INSERT INTO exp_actions (action_id, class, method) VALUES ('', 'Member', 'activate_member')";
        $sql[] = "INSERT INTO exp_actions (action_id, class, method) VALUES ('', 'Member', 'member_login')";
        $sql[] = "INSERT INTO exp_actions (action_id, class, method) VALUES ('', 'Member', 'member_logout')";
        $sql[] = "INSERT INTO exp_actions (action_id, class, method) VALUES ('', 'Member', 'retrieve_password')";
        $sql[] = "INSERT INTO exp_actions (action_id, class, method) VALUES ('', 'Member', 'reset_password')";
        $sql[] = "INSERT INTO exp_actions (action_id, class, method) VALUES ('', 'Member', 'send_member_email')";
        $sql[] = "INSERT INTO exp_actions (action_id, class, method) VALUES ('', 'Member', 'update_un_pw')";
		$sql[] = "INSERT INTO exp_actions (action_id, class, method) VALUES ('', 'Member', 'member_search')";
    	$sql[] = "INSERT INTO exp_actions (action_id, class, method) VALUES ('', 'Member', 'member_delete')";
    
        foreach ($sql as $query)
        {
            $DB->query($query);
        }
        
        return true;
    }
    /* END */
    
    
    /** -------------------------
    /**  Module de-installer
    /** -------------------------*/

    function member_module_deinstall()
    {
        global $DB;    

        $query = $DB->query("SELECT module_id FROM exp_modules WHERE module_name = 'Member'"); 
                
        $sql[] = "DELETE FROM exp_module_member_groups WHERE module_id = '".$query->row['module_id']."'";        
        $sql[] = "DELETE FROM exp_modules WHERE module_name = 'Member'";
        $sql[] = "DELETE FROM exp_actions WHERE class = 'Member'";
        $sql[] = "DELETE FROM exp_actions WHERE class = 'Member_CP'";
    
        foreach ($sql as $query)
        {
            $DB->query($query);
        }

        return true;
    }
    /* END */


}
// END CLASS
?>