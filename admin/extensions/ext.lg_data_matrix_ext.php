<?php
/**
* LG Data Matrix extension file
* 
* This file must be placed in the
* /system/extensions/ folder in your ExpressionEngine installation.
*
* @package LgDataMatrix
* @version 1.1.1
* @author Leevi Graham <http://leevigraham.com>
* @author Brandon Kelly <me@brandon-kelly.com>
* @see http://leevigraham.com/cms-customisation/expressionengine/addon/lg-data-matrix/
* @copyright Copyright (c) 2007-2009 Leevi Graham
* @license {@link http://creativecommons.org/licenses/by-sa/3.0/ Creative Commons Attribution-Share Alike 3.0 Unported} All source code commenting and attribution must not be removed. This is a condition of the attribution clause of the license.
*/

if ( ! defined('EXT')) exit('Invalid file request');

if ( ! defined('LG_DM_version')){
	define("LG_DM_version",			"1.1.1");
	define("LG_DM_docs_url",		"http://leevigraham.com/cms-customisation/expressionengine/addon/lg-data-matrix/");
	define("LG_DM_addon_id",		"LG Data Matrix");
	define("LG_DM_extension_class",	"Lg_data_matrix_ext");
	define("LG_DM_cache_name",		"lg_cache");
}

/**
* This extension adds a new custom field type to {@link http://expressionengine.com ExpressionEngine} that displays a drop down list of members from selected groups
*
* @package LgDataMatrix
* @version 1.1.1
* @author Leevi Graham <http://leevigraham.com>
* @see http://leevigraham.com/cms-customisation/expressionengine/addon/lg-data-matrix/
* @copyright Copyright (c) 2007-2009 Leevi Graham
* @license {@link http://creativecommons.org/licenses/by-sa/3.0/ Creative Commons Attribution-Share Alike 3.0 Unported} All source code commenting and attribution must not be removed. This is a condition of the attribution clause of the license.
*/

class Lg_data_matrix_ext {

	/**
	* Extension settings
	* @var array
	*/
	var $settings			= array();

	/**
	* Extension name
	* @var string
	*/
	var $name				= 'LG Data Matrix';

	/**
	* Extension version
	* @var string
	*/
	var $version			= LG_DM_version;

	/**
	* Extension description
	* @var string
	*/
	var $description		= 'Creates a data matrix custom field';

	/**
	* If $settings_exist = 'y' then a settings page will be shown in the ExpressionEngine admin
	* @var string
	*/
	var $settings_exist 	= 'y';

	/**
	* Link to extension documentation
	* @var string
	*/
	var $docs_url			= LG_DM_docs_url;

	/**
	* Custom field type id
	* @var string
	*/
	var $type 				= "data_matrix";
	
	var $debug 				= FALSE;

	/**
	* PHP4 Constructor
	*
	* @see __construct()
	*/
	function Lg_data_matrix_ext($settings='')
	{
		$this->__construct($settings);
	}

	/**
	* PHP 5 Constructor
	*
	* @param	array|string $settings Extension settings associative array or an empty string
	* @since	Version 0.0.1
	*/
	function __construct($settings='')
	{
		global $IN, $SESS;

		if(isset($SESS->cache['lg']) === FALSE){ $SESS->cache['lg'] = array();}

		$this->settings = $this->_get_settings();
	}

	/**
	* Get the site specific settings from the extensions table
	*
	* @param $force_refresh		bool	Get the settings from the DB even if they are in the $SESS global
	* @param $return_all		bool	Return the full array of settings for the installation rather than just this site
	* @return array 					If settings are found otherwise false. Site settings are returned by default. Installation settings can be returned is $return_all is set to true
	* @since version 0.0.1
	*/
	function _get_settings($force_refresh = FALSE, $return_all = FALSE)
	{

		global $SESS, $DB, $REGX, $LANG, $PREFS;

		// assume there are no settings
		$settings = FALSE;
		
		// Get the settings for the extension
		if(isset($SESS->cache['lg'][LG_DM_addon_id]['settings']) === FALSE || $force_refresh === TRUE)
		{
			// check the db for extension settings
			$query = $DB->query("SELECT settings FROM exp_extensions WHERE enabled = 'y' AND class = '" . LG_DM_extension_class . "' LIMIT 1");

			// if there is a row and the row has settings
			if ($query->num_rows > 0 && $query->row['settings'] != '')
			{
				// save them to the cache
				$SESS->cache['lg'][LG_DM_addon_id]['settings'] = $REGX->array_stripslashes(unserialize($query->row['settings']));
			}
		}
		// check to see if the session has been set
		// if it has return the session
		// if not return false
		if(empty($SESS->cache['lg'][LG_DM_addon_id]['settings']) !== TRUE)
		{
			if($return_all === TRUE)
			{
				$settings = $SESS->cache['lg'][LG_DM_addon_id]['settings'];
			}
			else
			{
				if(isset($SESS->cache['lg'][LG_DM_addon_id]['settings'][$PREFS->ini('site_id')]) === TRUE)
				{
					$settings = $SESS->cache['lg'][LG_DM_addon_id]['settings'][$PREFS->ini('site_id')];
				}
				else
				{
					$settings = $this->_build_default_settings();
				}
			}
		}

		return $settings;
	}

	/**
	* Configuration for the extension settings page
	* 
	* @param $current	array 		The current settings for this extension. We don't worry about those because we get the site specific settings
	* @since version 0.0.1
	**/
	function settings_form($current)
	{
		global $DB, $DSP, $LANG, $IN, $PREFS, $SESS;

		// create a local variable for the site settings
		$settings = $this->_get_settings();

		$DSP->crumbline = TRUE;

		$DSP->title  = $LANG->line('extension_settings');
		$DSP->crumb  = $DSP->anchor(BASE.AMP.'C=admin'.AMP.'area=utilities', $LANG->line('utilities')).
		$DSP->crumb_item($DSP->anchor(BASE.AMP.'C=admin'.AMP.'M=utilities'.AMP.'P=extensions_manager', $LANG->line('extensions_manager')));

		$DSP->crumb .= $DSP->crumb_item($LANG->line('lg_data_matrix_title') . " {$this->version}");

		$DSP->right_crumb($LANG->line('disable_extension'), BASE.AMP.'C=admin'.AMP.'M=utilities'.AMP.'P=toggle_extension_confirm'.AMP.'which=disable'.AMP.'name='.$IN->GBL('name'));

		$DSP->body = '';

		if(isset($settings['show_promos']) === FALSE) {$settings['show_promos'] = 'y';}
		if($settings['show_promos'] == 'y')
		{
			$DSP->body .= "<script src='http://leevigraham.com/promos/ee.php?id=" . rawurlencode(LG_DM_addon_id) ."&v=".$this->version."' type='text/javascript' charset='utf-8'></script>";
		}

		if(isset($settings['show_donate']) === FALSE) {$settings['show_donate'] = 'y';}
		if($settings['show_donate'] == 'y')
		{
			$DSP->body .= "<style type='text/css' media='screen'>
				#donate{float:right; margin-top:0; padding-left:190px; position:relative; top:-2px}
				#donate .button{background:transparent url(http://leevigraham.com/themes/site_themes/default/img/btn_paypal-donation.png) no-repeat scroll left bottom; display:block; height:0; overflow:hidden; position:absolute; top:0; left:0; padding-top:27px; text-decoration:none; width:175px}
				#donate .button:hover{background-position:top right;}
			</style>";
			$DSP->body .= "<p id='donate'>
							" . $LANG->line('donation') ."
							<a rel='external' href='https://www.paypal.com/cgi-bin/webscr?cmd=_donations&amp;business=sales%40newism%2ecom.au&amp;item_name=LG%20Expression%20Engine%20Development&amp;amount=%2e00&amp;no_shipping=1&amp;return=http%3a%2f%2fleevigraham%2ecom%2fdonate%2fthanks&amp;cancel_return=http%3a%2f%2fleevigraham%2ecom%2fdonate%2fno%2dthanks&amp;no_note=1&amp;tax=0&amp;currency_code=USD&amp;lc=US&amp;bn=PP%2dDonationsBF&amp;charset=UTF%2d8' class='button' target='_blank'>Donate</a>
						</p>";
		}

		$DSP->body .= $DSP->heading($LANG->line('lg_data_matrix_title') . " <small>{$this->version}</small>");
		
		$DSP->body .= $DSP->form_open(
								array(
									'action' => 'C=admin'.AMP.'M=utilities'.AMP.'P=save_extension_settings'
								),
								// WHAT A M*THERF!@KING B!TCH THIS WAS
								// REMEMBER THE NAME ATTRIBUTE MUST ALWAYS MATCH THE FILENAME AND ITS CASE SENSITIVE
								// BUG??
								array('name' => strtolower(LG_DM_extension_class))
		);

		// EXTENSION ACCESS
		$DSP->body .= $DSP->table_open(array('class' => 'tableBorder', 'border' => '0', 'style' => 'margin-top:18px; width:100%'));

		$DSP->body .= $DSP->tr()
			. $DSP->td('tableHeading', '', '2')
			. $LANG->line("access_rights")
			. $DSP->td_c()
			. $DSP->tr_c();

		$DSP->body .= $DSP->tr()
			. $DSP->td('tableCellOne', '40%')
			. $DSP->qdiv('defaultBold', $LANG->line('enable_extension_for_this_site'))
			. $DSP->td_c();

		$DSP->body .= $DSP->td('tableCellOne')
			. "<select name='enable'>"
				. $DSP->input_select_option('y', "Yes", (($settings['enable'] == 'y') ? 'y' : '' ))
				. $DSP->input_select_option('n', "No", (($settings['enable'] == 'n') ? 'y' : '' ))
				. $DSP->input_select_footer()
			. $DSP->td_c()
			. $DSP->tr_c();

		$DSP->body .= $DSP->table_c();

		// UPDATES
		$DSP->body .= $DSP->table_open(array('class' => 'tableBorder', 'border' => '0', 'style' => 'margin-top:18px; width:100%'));

		$DSP->body .= $DSP->tr()
			. $DSP->td('tableHeading', '', '2')
			. $LANG->line("check_for_updates_title")
			. $DSP->td_c()
			. $DSP->tr_c();

		$DSP->body .= $DSP->tr()
			. $DSP->td('', '', '2')
			. "<div class='box' style='border-width:0 0 1px 0; margin:0; padding:10px 5px'><p>" . $LANG->line('check_for_updates_info') . "</p></div>"
			. $DSP->td_c()
			. $DSP->tr_c();

		$DSP->body .= $DSP->tr()
			. $DSP->td('tableCellOne', '40%')
			. $DSP->qdiv('defaultBold', $LANG->line("check_for_updates_label"))
			. $DSP->td_c();

		$DSP->body .= $DSP->td('tableCellOne')
			. "<select name='check_for_updates'>"
				. $DSP->input_select_option('y', "Yes", (($settings['check_for_updates'] == 'y') ? 'y' : '' ))
				. $DSP->input_select_option('n', "No", (($settings['check_for_updates'] == 'n') ? 'y' : '' ))
				. $DSP->input_select_footer()
			. $DSP->td_c()
			. $DSP->tr_c();

		if($IN->GBL('lg_admin') != 'y')
		{
			$DSP->body .= $DSP->table_c();
			$DSP->body .= "<input type='hidden' value='".$settings['show_donate']."' name='show_donate' />";
			$DSP->body .= "<input type='hidden' value='".$settings['show_promos']."' name='show_promos' />";
		}
		else
		{
			$DSP->body .= $DSP->table_open(array('class' => 'tableBorder', 'border' => '0', 'style' => 'margin-top:18px; width:100%'));
			$DSP->body .= $DSP->tr()
				. $DSP->td('tableHeading', '', '2')
				. $LANG->line("lg_admin_title")
				. $DSP->td_c()
				. $DSP->tr_c();

			$DSP->body .= $DSP->tr()
				. $DSP->td('tableCellOne', '30%')
				. $DSP->qdiv('defaultBold', $LANG->line("show_donate_label"))
				. $DSP->td_c();

			$DSP->body .= $DSP->td('tableCellOne')
				. "<select name='show_donate'>"
						. $DSP->input_select_option('y', "Yes", (($settings['show_donate'] == 'y') ? 'y' : '' ))
						. $DSP->input_select_option('n', "No", (($settings['show_donate'] == 'n') ? 'y' : '' ))
						. $DSP->input_select_footer()
				. $DSP->td_c()
				. $DSP->tr_c();

			$DSP->body .= $DSP->tr()
				. $DSP->td('tableCellTwo', '30%')
				. $DSP->qdiv('defaultBold', $LANG->line("show_promos_label"))
				. $DSP->td_c();

			$DSP->body .= $DSP->td('tableCellTwo')
				. "<select name='show_promos'>"
						. $DSP->input_select_option('y', "Yes", (($settings['show_promos'] == 'y') ? 'y' : '' ))
						. $DSP->input_select_option('n', "No", (($settings['show_promos'] == 'n') ? 'y' : '' ))
						. $DSP->input_select_footer()
				. $DSP->td_c()
				. $DSP->tr_c();

			$DSP->body .= $DSP->table_c();
		}		

		$DSP->body .= $DSP->qdiv('itemWrapperTop', $DSP->input_submit())
					. $DSP->form_c();
	}

	/**
	* Save Settings
	**/
	function save_settings()
	{
		// make somethings global
		global $DB, $IN, $PREFS, $REGX, $SESS;

		// unset the name
		unset($_POST['name']);
		
		// load the settings from cache or DB
		// force a refresh and return the full site settings
		$settings = $this->_get_settings(TRUE, TRUE);

		// add the posted values to the settings
		$settings[$PREFS->ini('site_id')] = $_POST;

		// update the settings
		$query = $DB->query($sql = "UPDATE exp_extensions SET settings = '" . addslashes(serialize($settings)) . "' WHERE class = '" . LG_DM_extension_class . "'");
	}

	/**
	* Returns the default settings for this extension
	* This is used when the extension is activated or when a new site is installed
	* 
	* @since 1.1.0
	* @return array The default settings array
	*/
	function _build_default_settings()
	{
		global $PREFS;
		$default_settings = array(
								'jquery_core_path' 	=> 'http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js',
								'jquery_ui_path' 	=> $PREFS->ini('theme_folder_url', 1) . "cp_themes/".$PREFS->ini('cp_theme')."/lg_data_matrix/js/jquery.ui.core+interactions.1.6.min.js",
								'enable' 			=> 'y',
								'check_for_updates' => 'y',
								'show_donate'		=> 'y',
								'show_promos'		=> 'y'
						);

		return $default_settings;
	}

	/**
	* Activates the extension
	*
	* @return	bool Always TRUE
	*/
	function activate_extension()
	{
		global $DB, $PREFS;

		// get the default settings
		$default_settings = $this->_build_default_settings();

		// get the list of installed sites
		$query = $DB->query("SELECT * FROM exp_sites");

		// if there are sites - we know there will be at least one but do it anyway
		if ($query->num_rows > 0)
		{
			// for each of the sites
			foreach($query->result as $row)
			{
				// build a multi dimensional array for the settings
				$settings[$row['site_id']] = $default_settings;
			}
		}

		$hooks = array(
			'publish_form_start'					=> 'publish_form_start',
			'publish_admin_edit_field_js'			=> 'publish_admin_edit_field_js',
			'publish_form_field_unique'				=> 'publish_form_field_unique',
			'submit_new_entry_start'				=> 'submit_new_entry_start',
			'show_full_control_panel_end' 			=> 'show_full_control_panel_end',
			'publish_admin_edit_field_type_pulldown'=> 'publish_admin_edit_field_type_pulldown',
			'publish_admin_edit_field_type_celltwo'	=> 'publish_admin_edit_field_type_celltwo',
			'weblog_entries_tagdata_end'			=> 'weblog_entries_tagdata_end',
			'lg_addon_update_register_source'		=> 'lg_addon_update_register_source',
			'lg_addon_update_register_addon'		=> 'lg_addon_update_register_addon'
		);

		foreach ($hooks as $hook => $method)
		{
			$sql[] = $DB->insert_string( 'exp_extensions', 
											array('extension_id'=> '',
												'class'			=> get_class($this),
												'method'		=> $method,
												'hook'			=> $hook,
												'settings'		=> addslashes(serialize($settings)),
												'priority'		=> 10,
												'version'		=> $this->version,
												'enabled'		=> "y"
											)
										);
		}

		$field_query = $DB->query("SHOW COLUMNS FROM `exp_weblog_fields` WHERE Field = 'lg_field_conf'");
		if($field_query->num_rows == 0)
		{
			$sql[] = "ALTER TABLE `exp_weblog_fields` ADD `lg_field_conf` TEXT NOT NULL";
		}

		// run all sql queries
		foreach ($sql as $query)
		{
			$DB->query($query);
		}

		return TRUE;

	}

	/**
	* Updates the extension
	*
	* If the exisiting version is below 1.2 then the update process changes some
	* method names. This may cause an error which can be resolved by reloading
	* the page.
	*
	* @param	string $current If installed the current version of the extension otherwise an empty string
	* @return	bool FALSE if the extension is not installed or is the current version
	*/
	function update_extension($current = '')
	{
		global $DB;

		if ($current == '' OR $current == $this->version)
		{
			return FALSE;
		}

		$settings = $this->_get_settings(TRUE, TRUE);

		// Integrated LG Addon Updater
		// Changed the show_full_control_panel_start hook to lg_addon_update_register_source
		// Changed the control_panel_home_page hook to lg_addon_update_register_addon
		if($current < '0.0.6')
		{
			// delete the control_panel_home_page hook
			$sql[] = "DELETE FROM `exp_extensions` WHERE `class` = '".get_class($this)."' AND `hook` = 'control_panel_home_page'";
			// create two new hooks
			$hooks = array(
				'lg_addon_update_register_source'	=> 'lg_addon_update_register_source',
				'lg_addon_update_register_addon'	=> 'lg_addon_update_register_addon'
			);
			// for each of the new hooks
			foreach ($hooks as $hook => $method)
			{
				// build the sql
				$sql[] = $DB->insert_string( 'exp_extensions', 
												array('extension_id' 	=> '',
													'class'			=> get_class($this),
													'method'		=> $method,
													'hook'			=> $hook,
													'settings'		=> addslashes(serialize($settings)),
													'priority'		=> 10,
													'version'		=> $this->version,
													'enabled'		=> "y"
												)
											);
			}
		}

		if($current < '1.1.0')
		{
			// build the sql
			$DB->query($DB->insert_string( 'exp_extensions', 
											array('extension_id' 	=> '',
												'class'			=> get_class($this),
												'method'		=> "publish_form_start",
												'hook'			=> "publish_form_start",
												'settings'		=> addslashes(serialize($settings)),
												'priority'		=> 10,
												'version'		=> $this->version,
												'enabled'		=> "y"
											)
										));

			// grab all the old fields
			$old_fields = $DB->query("SELECT * FROM `exp_weblog_fields` WHERE field_type = '".$this->type."'");

			foreach ($old_fields->result as $row)
			{
				if(($old_conf = @unserialize($row["lg_field_conf"])) !== FALSE)
				{
					$DB->query($DB->update_string("exp_weblog_fields", array("lg_field_conf" => $old_conf["string"]), array("field_id" => $row["field_id"])));
				}
			}
		}
		
		if($current < "1.1.1")
		{
			$DB->query("DELETE FROM `exp_extensions` WHERE class = '".get_class($this)."' AND `hook` = 'submit_new_entry_end'");
		}

		$sql[] = "UPDATE exp_extensions SET version = '" . $DB->escape_str($this->version) . "' WHERE class = '" . get_class($this) . "'";

		// run all sql queries
		foreach ($sql as $query)
		{
			$DB->query($query);
		}
	}

	/**
	* Disables the extension the extension and deletes settings from DB
	*/
	function disable_extension()
	{
		global $DB;
		$DB->query("DELETE FROM exp_extensions WHERE class = '" . get_class($this) . "'");
	}

	/**
	* Method for the publish_form_start hook
	*
	* - Runs before any data id processed
	* - Sets local $SESS->cache[] array element to store the action
	* - Sets local $SESS->cache[] array element to store the entry_id
	*
	* Checks if the user is performing a quicksave. If they are modify the post vars and update the relations
	* Store the entry id and action just incase we need it later
	*
	* @param    string $which The current action (new, preview, edit, or save)
	* @param    string $submission_error A submission error if any
	* @param    string $entry_id The current entries id
	* @see      http://expressionengine.com/developers/extension_hooks/publish_form_start/
	* @since    Version 1.1.0
	*/
	function publish_form_start( $which, $submission_error, $entry_id, $hidden )
	{
		if($this->debug === TRUE) print("<br /><br />".memory_get_usage()." publish_form_start: start: " . $which);

		global $DB, $IN, $SESS;

		// sometimes the entry id passed can be empty but it's included in the $_POST, $_GET
		if(empty($entry_id) === TRUE) $entry_id = $IN->GBL("entry_id");

		// action will always be passed
		$SESS->cache['lg'][LG_DM_addon_id]['publish_form_action'] = $which;
		$SESS->cache['lg'][LG_DM_addon_id]['publish_form_entry_id'] = $entry_id;

		if($this->debug === TRUE) print("<br />".memory_get_usage()." publish_form_start: end: " . $which);

	}

	/**
	* Modifies the input of the select box if multiples are selected
	*
	* @param	array $data The data about this field from the database
	* @return	string $r The page content
	* @since 	Version 0.0.1
	* @author   Leevi Graham <http://leevigraham.com>
	* @author   Brandon Kelly <me@brandon-kelly.com>
	*/
	function submit_new_entry_start()
	{

		if($this->debug === TRUE) print("<br /><br />".memory_get_usage()." submit_new_entry_start: start");

		global $DB, $IN, $REGX, $SESS, $LOC;

		// get all the member list fields
		$query = $DB->query("SELECT field_id, lg_field_conf FROM `exp_weblog_fields` WHERE field_type = '".$this->type."'");

		// for each of the fields
		foreach ($query->result as $row)
		{
			// if this one has been used
			if($matrix = $IN->GBL('field_id_' . $row['field_id'], 'POST'))
			{
				$conf = $this->_parse_conf($row);
				$post_rows = $this->_convert_col_array_to_rows($REGX->xss_clean($matrix), $conf);
				$rows = FALSE;
				foreach ($post_rows as $row_count => $cells)
				{
					foreach ($cells as $cell)
					{
						if(empty($cell) !== TRUE)
						{
							$rows[]  = $post_rows[$row_count];
							continue 2;
						}
					}
				}

				// unset all of the extra post values like 'field_id_13_0'
				foreach ($_POST['field_id_' . $row['field_id']] as $key => $value)
				{
					unset($_POST['field_id_' . $row['field_id'] . "_" . $key]);
				}
				// implode the array of multiple values into a string
				//$SESS->cache['lg'][LG_DM_addon_id]['fields'][$row['field_id']] = $matrix;
				$_POST['field_id_' . $row['field_id']] = ($rows !== FALSE) ? addslashes(serialize($rows)) : '';
				$_POST['field_ft_' . $row['field_id']] = "none";
			}
		}
		if($this->debug === TRUE) print("<br />".memory_get_usage()." submit_new_entry_start: end");
	}

	/**
	* Modify the tagdata for the weblog entries before anything else is parsed
	* @param 	string		$tag_data		The Weblog Entries tag data
	* @param	array 		$row			Array of data for the current entry
	* @param 	object		$this			The current Weblog object including all data relating to categories and custom fields
	*/
	function weblog_entries_tagdata_end($r, $row, $weblog)
	{
		global $DB, $EXT, $PREFS, $FNS, $LOC, $REGX, $SESS, $TMPL, $Weblog;

		$site_id = $PREFS->ini('site_id');

		if($EXT->last_call !== false)
		{
			$r = $EXT->last_call;
		}

		$custom_date_fields = array();

		// get all the fields for this field type
		if(isset($SESS->cache['lg'][LG_DM_addon_id]['field_query']) === FALSE)
		{
			// get all the LG Data Matrix field types
			$query = $DB->query("SELECT field_name, field_id, lg_field_conf FROM exp_weblog_fields f WHERE f.field_type='".$this->type."' AND site_id = " . $site_id);
			$SESS->cache['lg'][LG_DM_addon_id]['field_query'] = $query->result;

			// for each field type parse its config
			foreach($SESS->cache['lg'][LG_DM_addon_id]['field_query'] as $key => $field)
			{
				$SESS->cache['lg'][LG_DM_addon_id]['field_query'][$key]['lg_field_conf'] = $this->_parse_conf($field);
			}
		}

		// loop through the LG Data Matrix custom fields
		foreach($SESS->cache['lg'][LG_DM_addon_id]['field_query'] as $key => $field)
		{
			// if this row does not have this custom field continue
			if(isset($row['field_id_'.$field['field_id']]) === FALSE) continue;

			$col_data = FALSE;
			$row_data = FALSE;

			// check if we have already parsed this fields conf into an array... we might be using it in a loop
			// just saves us a little bit of processsing each time
			if(is_array($SESS->cache['lg'][LG_DM_addon_id]['field_query'][$key]['lg_field_conf']) === FALSE)
			{
				$SESS->cache['lg'][LG_DM_addon_id]['field_query'][$key]['lg_field_conf'] = $this->_parse_conf($field);
			}
			$conf = $SESS->cache['lg'][LG_DM_addon_id]['field_query'][$key]['lg_field_conf'];

			// get the LG Data Matrix field values
			if(
				// if the field data is not empty then it must be a string
				// the value is stored as a serialised array
				empty($row['field_id_'.$field['field_id']]) !== TRUE
			)
			{
				$clean_row_data = $REGX->array_stripslashes(unserialize($row['field_id_'.$field['field_id']]));
			}
			else
			{
				$clean_row_data = FALSE;
			}

			// process all lg_data_matrix custom field tags
			preg_match_all("/".LD.$field['field_name']."(.*?)".RD."(.*?)".LD.SLASH.$field['field_name'].RD."/s", $r, $tags);

			foreach($tags[0] as $key => $tag)
			{ 
				$tag_chunk = $tags[0][$key];

				if($clean_row_data !== FALSE)
				{
					$tag_chunk_content = $tags[2][$key];

					$params['limit'] = 100;
					$params['flip'] = 'n';
					$params['backspace'] = 0;

					if(is_array($tag_params = $FNS->assign_parameters($tags[1][$key])) === TRUE)
					{
						$params = array_merge($params, $tag_params);
					}

					// reverse row data
					$dirty_row_data = ($params['flip'] == 'y') ? array_reverse($clean_row_data) : $clean_row_data;

					$total_rows = count($dirty_row_data);

					$enable = array(
						'cells' 			=> TRUE,
						'headers'			=> TRUE,
						'rows'				=> TRUE
					);

					if(isset($tag_params['disable']))
					{
						foreach (explode("|", $tag_params['disable']) as $val)
						{
							if (isset($enable[$val]))
							{  
								$enable[$val] = FALSE;
							}
						}
					}

					if($enable['headers'] === TRUE)
					{
						// do headers
						preg_match_all("/".LD."headers(.*?)".RD."(.*?)".LD.SLASH."headers".RD."/s", $tag_chunk, $headers);

						foreach($headers[0] as $header_key => $header_tag)
						{
							$header_chunk = $headers[0][$header_key];
							//$header_params = $FNS->assign_parameters($headers[1][$header_key]);
							$header_chunk_content = $headers[2][$header_key];

							$header_inner = '';
							foreach ($conf['cols'] as $short_name => $col_attr)
							{
								$tagdata = $header_chunk_content;
								$tagdata = $TMPL->swap_var_single("col_short_name", $short_name, $tagdata);
								$tagdata = $TMPL->swap_var_single("col_title", $col_attr['title'], $tagdata);
								$header_inner .= $tagdata;
							}
							$tag_chunk_content = str_replace($header_chunk, $header_inner, $tag_chunk_content);
						}
					}

					if($enable['rows'] === TRUE)
					{
						// do rows
						preg_match_all("/".LD."rows(.*?)".RD."(.*?)".LD.SLASH."rows".RD."/s", $tag_chunk, $row_tags);

						foreach($row_tags[0] as $row_key => $row_tag)
						{
							$row_chunk = $row_tags[0][$row_key];
							$row_chunk_content = $row_tags[2][$row_key];

							if(is_array($row_params = $FNS->assign_parameters($row_tags[1][$row_key])) === TRUE)
							{
								$row_params = array_merge(array("backspace" => 0), $row_params);
							}

							$row_inner = '';
							$i = 0;

							// loop over each of the data sets rows
							foreach ($dirty_row_data as $row_count => $row_data)
							{
								if($params['limit'] == $i)
								{
									break;
								}

								$i++;

								// create a new template to modify
								$row_template = $row_chunk_content;

								// merge the row conf with the cell value so we know it's type and other attributes
								foreach ($row_data as $col_short_name => $cell_data)
								{
									$row_data[$col_short_name] = array();
									$row_data[$col_short_name]['cell_data'] = $cell_data;
									$row_data[$col_short_name]['cell_type'] = $conf["cols"][$col_short_name]["type"];
									$row_data[$col_short_name] += $conf["cols"][$col_short_name];
									$row_data["row_count"] =  $row_count + 1;

									if($row_data[$col_short_name]['type'] == "date")
									{
										preg_match_all("/".LD.$col_short_name."\s+format=[\"'](.*?)[\"']".RD."/s", $row_template, $matches);
										for ($i=0, $dfs = count($matches[0]); $i < $dfs; $i++)
										{ 
											if(isset($LOC->format[$matches[1][$i]]))
											{
												$matches[1][$i] = $LOC->format[$matches[1][$i]];
											}
											$row_template = str_replace($matches[0][$i], $LOC->decode_date($matches[1][$i], $cell_data), $row_template);
										}
									}
									if(strpos($row_template, $col_short_name) !== FALSE)
									{
										$row_template = $TMPL->swap_var_single($col_short_name, $this->_encode($cell_data), $row_template);
									}
								}
								if(strpos($row_template, "row_count") !== FALSE)
								{
									$row_template = $TMPL->swap_var_single("row_count", ($row_count + 1), $row_template);
								}

								$row_template = $FNS->prep_conditionals($row_template, $dirty_row_data[$row_count]);

								unset($row_data["row_count"]);

								if($enable['cells'] === TRUE)
								{
									// do cells
									// this is where it gets funky
									// we want to grab the {cell} tag out of the row template
									preg_match_all("/".LD."cells".RD."(.*?)".LD.SLASH."cells".RD."/s", $row_template, $cells);
						
									// there may be multiple {cell} tags in this row :(
									foreach($cells[0] as $cell_key => $cell_tag)
									{
										$cell_chunk = $cells[0][$cell_key];
										//$cell_params = $FNS->assign_parameters($cells[1][$cell_key]);
										$cell_chunk_content = $cells[1][$cell_key];

										$cell_inner = '';

										// loop over the row_data and build the cells
										foreach ($row_data as $col_short_name => $cell_data)
										{
											$cell_template = $cell_chunk_content;

											$cell_template = $TMPL->swap_var_single("col_short_name", $col_short_name, $cell_template);
											$cell_template = $TMPL->swap_var_single("col_title", $cell_data['title'], $cell_template);
											$cell_template = $TMPL->swap_var_single("cell_data", $this->_encode($cell_data["cell_data"]), $cell_template);

											$cell_template = $FNS->prep_conditionals($cell_template, $cell_data);

											if($cell_data['type'] == "date")
											{
												preg_match_all("/".LD."cell_data\s+format=[\"'](.*?)[\"']".RD."/s", $cell_template, $matches);

												for ($i=0, $dfs = count($matches[0]); $i < $dfs; $i++)
												{ 
													if(isset($LOC->format[$matches[1][$i]]))
													{
														$matches[1][$i] = $LOC->format[$matches[1][$i]];
													}
													$cell_template = str_replace($matches[0][$i], $LOC->decode_date($matches[1][$i], $cell_data["cell_data"]), $cell_template);
												}
											}
											$cell_inner .= $cell_template;
										}
										// now we have the new cels content
										// replace the cell_chunk with the cells
										$row_template = str_replace($cell_chunk, $cell_inner, $row_template);
									}
								}
								$row_inner .= substr($row_template, 0, strlen($row_template) - $row_params['backspace']);
							}
							$tag_chunk_content = str_replace($row_chunk, $row_inner, $tag_chunk_content);
						}
					}

					$tag_chunk_content = $FNS->prep_conditionals($tag_chunk_content, array("total_row_count" => $total_rows));

					if(strpos($tag_chunk_content, "total_row_count") !== FALSE)
					{
						$tag_chunk_content = str_replace(LD."total_row_count".RD, $total_rows, $tag_chunk_content);
					}
				}
				else
				{
					$tag_chunk_content = '';
				}
				$r = str_replace($tag_chunk, $tag_chunk_content, $r);
			}
		}
		return $r;
	}

	/**
	* Takes the control panel html and replaces the drop down
	*
	* @param	string $out The control panel html
	* @return	string The modified control panel html
	* @since 	Version 0.0.1
	*/
	function show_full_control_panel_end( $out )
	{
		global $DB, $EXT, $IN, $PREFS, $REGX, $SESS;

		// -- Check if we're not the only one using this hook
		if($EXT->last_call !== FALSE)
			$out = $EXT->last_call;
		
		$js = $css = "";

		// if we are displaying the custom field list
		if($IN->GBL('M', 'GET') == 'blog_admin' && ($IN->GBL('P', 'GET') == 'field_editor' || $IN->GBL('P', 'GET') == 'update_weblog_fields')  || $IN->GBL('P', 'GET') == 'delete_field')
		{
			// get the table rows
			if( preg_match_all("/C=admin&amp;M=blog_admin&amp;P=edit_field&amp;field_id=(\d*).*?<\/td>.*?<td.*?>.*?<\/td>.*?<\/td>/is", $out, $matches) )
			{
				// for each field id
				foreach($matches[1] as $key=>$field_id)
				{
					// get the field type
					$query = $DB->query("SELECT field_type FROM exp_weblog_fields WHERE field_id='" . $DB->escape_str($field_id) . "' LIMIT 1");

					// if the field type is wysiwyg
					if($query->row["field_type"] == $this->type)
					{
						$out = preg_replace("/(C=admin&amp;M=blog_admin&amp;P=edit_field&amp;field_id=" . $field_id . ".*?<\/td>.*?<td.*?>.*?<\/td>.*?)<\/td>/is", "$1" . $REGX->form_prep($this->name) . "</td>", $out);
					}
				}
			}
		}
		if(
			// we haven't already included the script
			isset($SESS->cache['lg'][LG_DM_addon_id]['scripts_included']) === FALSE &&
			// AND a LG Image Manager field has been rendered
			isset($SESS->cache['lg'][LG_DM_addon_id]['require_scripts']) === TRUE &&
			// AND its a publish or an edit page
			($IN->GBL('C', 'GET') == 'publish' || $IN->GBL('C', 'GET') == 'edit')
		)
		{
			//$css .= "\n<link rel='stylesheet' type='text/css' media='screen' href='" . $PREFS->ini('theme_folder_url', 1) . "jquery_ui/".$PREFS->ini('cp_theme')."/ui.core.css' />";
			//$css .= "\n<link rel='stylesheet' type='text/css' media='screen' href='" . $PREFS->ini('theme_folder_url', 1) . "jquery_ui/".$PREFS->ini('cp_theme')."/ui.theme.css' />";
			//$css .= "\n<link rel='stylesheet' type='text/css' media='screen' href='" . $PREFS->ini('theme_folder_url', 1) . "jquery_ui/".$PREFS->ini('cp_theme')."/ui.datepicker.css' />";
			$css .= "\n<link rel='stylesheet' type='text/css' media='screen' href='" . $PREFS->ini('theme_folder_url', 1) . "cp_themes/".$PREFS->ini('cp_theme')."/lg_data_matrix/css/admin.css' />";
			$js .= "\n<script type='text/javascript' charset='utf-8' src='". $PREFS->ini('theme_folder_url', 1) . "cp_themes/".$PREFS->ini('cp_theme')."/lg_data_matrix/js/jquery.data_matrix.js'></script>";

			// add the script string before the closing head tag
			$out = str_replace("</head>", $css . "</head>", $out);
			$out = str_replace("</body>", $js . "</body>", $out);
			// make sure we don't add it again
			$SESS->cache['lg'][LG_DM_addon_id]['scripts_included'] = TRUE;
		}
		return $out;
	}

	/**
	* Allows modifying or adding onto Custom Weblog Field JS
	*
	* @param 	array	$data	The custom fields data in the database (values will be empty if a new field)
    * @param 	string	$js		Currently existing javascript
	* @see		http://expressionengine.com/developers/extension_hooks/publish_admin_edit_field_js/
	*/
	function publish_admin_edit_field_js($data, $js)
	{
		
		global $EXT;
		
		if($EXT->last_call !== false){$js = $EXT->last_call;}

		// set the options for the cell
		$items = array(
			"date_block" => "none",
			"select_block" => "none",
			"pre_populate" => "none",
			"text_block" => "none",
			"textarea_block" => "none",
			"rel_block" => "none",
			"relationship_type" => "none",
			"formatting_block" => "none",
			"formatting_unavailable" => "block",
			"direction_available" => "none",
			"direction_unavailable" => "block",
			"populate_block_man" => "block",
			"lg_multi_text" => "block"
		);

		$newJs = "$1\n\t\telse if (id == '".$this->type."'){";

		foreach ($items as $key => $value)
		{
			$newJs .= "\n\t\t\tdocument.getElementById('" . $key . "').style.display = '" . $value . "'";
		}

		// automatically make this field have no formatting
		$newJs .= "\n\t\t\tdocument.field_form.field_fmt.selectedIndex = 0;\n";
		$newJs .= "\t\t}";

		 // -- Add the JS
		$js = preg_replace("/(id\s*==\s*.rel.*?})/is", $newJs, $js);

		// add our show hide of non lg 
		$newJs = "if(id != '".$this->type."'){document.getElementById('lg_multi_text').style.display = 'none';}\n\n\t\t";
		$js = str_replace("if (id == 'text')", $newJs . "if (id == 'text')", $js);

		return $js;

	}

	/**
	* Allows modifying or adding onto Custom Weblog Field Type Pulldown
	*
	* @param 	array 	$data 		The custom fields data in the database (values will be empty if a new field)
    * @param 	string 	$typemenu 	Currently existing javascript
	* @see		http://expressionengine.com/developers/extension_hooks/publish_admin_edit_field_type_pulldown/
	*/
	function publish_admin_edit_field_type_pulldown($data, $typemenu)
	{
		global $EXT, $REGX;
		if($EXT->last_call !== false){$typemenu = $EXT->last_call;}
		$selected = ($data["field_type"] == $this->type) ? " selected='true'" : "";
		$typemenu .= "<option value='{$this->type}'{$selected}>".$REGX->form_prep($this->name)."</option>";
		return $typemenu;
	}

	/**
	* Allows modifying or adding onto Custom Weblog Field Type - Second Table Cell
	*
	* @param 	array 	$data 		The custom fields data in the database (values will be empty if a new field)
    * @param 	string 	$typopts 	Currently existing javascript
	* @see		http://expressionengine.com/developers/extension_hooks/publish_admin_edit_field_type_celltwo/
	*/
	function publish_admin_edit_field_type_celltwo($data, $typopts)
	{
		global $EXT, $LANG, $REGX;
		if($EXT->last_call !== false){$typopts = $EXT->last_call;}
		$display = ($data["field_type"] == $this->type) ? "block" : "none";
		$typopts .= '<div id="lg_multi_text" style="display: '.$display.';">
		<div class="itemWrapper">'.$LANG->line('field_configuration_instructions').'</div>
		<textarea class="textarea" name="lg_field_conf" id="lg_field_conf" rows="20" cols="90" style="width:99%">'.$data['lg_field_conf'].'</textarea>
		</div>';
		return $typopts;
	}

	/**
	* Renders the custom field in the publish / edit form and sets a $SESS->cache array element so we know the field has been rendered
	*
	* @param	array $row Parameters for the field from the database
	* @param	string $field_data If entry is not new, this will have field's current value
	* @return	string The custom field html
	* @since 	Version 0.0.1
	*/
	function publish_form_field_unique( $field, $field_data )
	{
		if($this->debug === TRUE) print("<br /><br />".memory_get_usage()." publish_form_field_unique: start");

		global $DB, $DSP, $EXT, $IN, $LANG, $REGX, $SESS, $XML;

		// -- Check if we're not the only one using this hook
		$r = ($EXT->last_call !== false) ? $EXT->last_call : "";
		
		// if we have a match on field types
		if($field["field_type"] == $this->type)
		{

			$this->row_count = 0;
			$LANG->fetch_language_file('lg_data_matrix_ext');

			if(empty($field['lg_field_conf']) === TRUE)
			{
				return $r .= "<p class='highlight'>".$LANG->line('field_configuration_error')."</p>";
			};

			$field_conf = $this->_parse_conf($field);

			// do the table headers
			$r .= "<ul class='defaultBold tableHeading clearfix'>";
			foreach ($field_conf['cols'] as $col)
			{
				if(isset($col['width']) === FALSE)
				{
					$col['width'] = $field_conf['default_col_width'];
				}
				$r .= "\n\t<li style='width:{$col['width']}%'><div>{$col['title']}</div></li>";
			}
			$r.="\n</ul>";

			$which = $SESS->cache['lg'][LG_DM_addon_id]['publish_form_action'];

			if($field_data == "")
			{
				$r .= $this->_build_row($field['field_id'], $field_conf['cols']);
			}
			else
			{
				// this statement makes sure we are getting the right values to put into our cells.
				if(($which == "preview" || $which == "edit") && is_array($field_data))
				{
					$field_data = $this->_convert_col_array_to_rows($field_data, $field_conf);
				}
				elseif($which == "save" || $which == "edit" || $which == "preview")
				{
					$field_data = $REGX->array_stripslashes(unserialize($field_data));
				}

				// build rows
				foreach ($field_data as $row)
				{
					$r .= $this->_build_row($field['field_id'], $field_conf['cols'], $row);
				}
			}

			$r = "<div class='lg_multi-text-field'>".$r."</div> <a class='add-row'>".$LANG->line('add_row')."</a>";

			$SESS->cache['lg'][LG_DM_addon_id]['require_scripts'] = TRUE;

		}

		if($this->debug === TRUE) print("<br />".memory_get_usage()." publish_form_field_unique: end");

		return $r;
	}

	/**
	* Parses the configuration string and returns an array
	*
	* @param $row		array		The custom field array
	* @return 			array 		The configuration
	* @since version 0.0.1
	*/
	function _parse_conf($row)
	{
		global $DB, $SESS;
		
		if(isset($SESS->cache['lg'][LG_DM_addon_id]['lg_field_conf'][$row["field_id"]]) === FALSE)
		{
			$groups = preg_split("/[\r\n]{2,}/", trim($row["lg_field_conf"]));

			if(count($groups) == 0) return FALSE;

			$conf = array();
			$col_count = 0;
			$total_width = 0;
			$cols_with_width = 0;

			foreach ($groups as $group)
			{
				$lines = (explode("\n", $group));
				foreach ($lines as $line) {
					$parts = explode("=", $line);
					$col[trim($parts[0])] = trim($parts[1]);
				}
				if(isset($col['width']) === TRUE)
				{
					$total_width += $col['width'];
					$cols_with_width++;
				}
				$cols[$col['short_name']] = $col;
				unset($col);
				$col_count++;
			}

			// get our parsed values and add them to another array element
			$conf['default_col_width'] = ((100 - $total_width) / ($col_count - $cols_with_width));
			$conf['col_count'] = $col_count;
			$conf['cols'] = $cols;
			$conf['string'] = $row["lg_field_conf"];

			$SESS->cache['lg'][LG_DM_addon_id]['lg_field_conf'][$row["field_id"]] = $conf;
		}
		
		return $SESS->cache['lg'][LG_DM_addon_id]['lg_field_conf'][$row["field_id"]];
	}

	/**
	* Builds a matrix row for the administration
	*
	* @param	$cols		array		the col data
	* @param	$values		array		the row data
	* @return				string		the row html
	* @since 	version 0.0.1
	*/
	function _build_row($field_id, $cols, $values = array())
	{
		global $LANG;
		$class = ($this->row_count % 2) ? 'tableCellTwo':'tableCellOne';
		$row = "\n<div class='row {$class}'>";
		$i = 0;
		foreach ($cols as $col) {
			$row .= $this->_build_cell($field_id, $col, $i, isset($values[$col['short_name']]) ? $values[$col['short_name']] : '');
			$i++;
		}
		$this->row_count++;
		return $row . "<a class='delete'>".$LANG->line('delete_row')."</a><a class='sort-handle'>".$LANG->line('sort_rows')."</a>\n</div>";
	}

	/**
	* Builds the cell html
	*
	* @param	$col		array		the col data
	* @param	$count		int			the cell count
	* @param	$value		string		the cell data
	* @return				string		the cell html
	* @since 	version 0.0.1
	* @author   Leevi Graham <http://leevigraham.com>
	* @author   Brandon Kelly <me@brandon-kelly.com>
	*/
	function _build_cell($field_id, $col, $count, $value = '')
	{
		global $REGX, $SESS;

		switch ($col['type'])
		{
			case 'textarea':
				$rows = (isset($col['rows']) === TRUE) ? $col['rows'] : 4;
				$cell = "<textarea class='textarea' name='field_id_{$field_id}[{$col['short_name']}][{$this->row_count}]' rows='{$rows}'>".$REGX->form_prep($value)."</textarea>";
				break;

			case 'select':
				$cell = "<select name='field_id_{$field_id}[{$col['short_name']}][{$this->row_count}]'>";
				foreach (explode("|",$col['options']) as $option)
				{
					$parts = explode(":", $option);
					$parts[1] = (isset($parts[1]) === TRUE) ? $parts[1] : $parts[0];
					$selected = ($value == $parts[0]) ? " selected='selected'" : '';
					$cell .= "\n\t\t\t<option value='".$REGX->form_prep($parts[0])."'{$selected}>{$parts[1]}</option>";
				}
				$cell .= "\n\t\t</select>";
				break;

			case 'checkbox':
				$cell_value = (isset($col['value']) === TRUE) ? $col['value'] : 'y';
				$checked = (empty($value) === FALSE) ? 'checked="checked"' : '';
				$cell = "<input type='checkbox' name='field_id_{$field_id}[{$col['short_name']}][{$this->row_count}]' value='".$REGX->form_prep($cell_value)."' {$checked} />";
				break;

			case 'date':
				global $DSP, $LOC, $LANG;
				if ($value AND ! is_numeric($value)) $value = '';
				$name = "field_id_{$field_id}[{$col['short_name']}][{$this->row_count}]";
				$cell = $DSP->input_text($name, ($value ? $LOC->set_human_time($value) : ''), '18', '23', 'input date-picker', '');
				$cell .= ' <a href="javascript:void(0);" onClick="$(this).prev().val(\''.$LOC->set_human_time($LOC->now).'\');" >'.$LANG->line('today').'</a>';
				break;

			default:
				$cell = "<input value='".$REGX->form_prep($value)."' name='field_id_{$field_id}[{$col['short_name']}][{$this->row_count}]' type='text' />";
				break;
		}

		if(isset($col['width']) === FALSE)
		{
			$col['width'] = $SESS->cache['lg'][LG_DM_addon_id]['lg_field_conf'][$field_id]["default_col_width"];
		}

		return "\n\t<div class='cell lgdm-{$col['type']}' style='width:{$col['width']}%'>\n\t\t<div>{$cell}</div>\n\t</div>";
	}

	/**
	* Swaps the col array into rows
	*
	* @param	$data		array		the col array
	* @return				array		the reversed col array
	* @since 	version 0.0.1
	*/
	function _convert_col_array_to_rows($data, $conf)
	{
		global $LOC, $REGX;

		if(empty($data)) return FALSE;

		$tmp = array();

		for ($i=0, $row_count = count(current($data)); $i < $row_count; $i++)
		{ 
			foreach (array_keys($data) as $col_short_name)
			{
				if($conf["cols"][$col_short_name]["type"] == "date" && $data[$col_short_name][$i] != FALSE)
				{
					$tmp[$i][$col_short_name] = $LOC->convert_human_date_to_gmt($data[$col_short_name][$i]);
				}
				else
				{
					$tmp[$i][$col_short_name] = @$data[$col_short_name][$i];
				}
			}
		}

		return $tmp;
	}

	/**
	* Register a new Addon Source
	*
	* @param	array $sources The existing sources
	* @return	array The new source list
	* @since 	Version 0.0.6
	*/
	function lg_addon_update_register_source($sources)
	{
		global $EXT;
		// -- Check if we're not the only one using this hook
		if($EXT->last_call !== FALSE)
			$sources = $EXT->last_call;

		// add a new source
		// must be in the following format:
		/*
		<versions>
			<addon id='LG Addon Updater' version='2.0.0' last_updated="1218852797" docs_url="http://leevigraham.com/" />
		</versions>
		*/
		if($this->settings['check_for_updates'] == 'y')
		{
			$sources[] = 'http://leevigraham.com/version-check/versions.xml';
		}

		return $sources;

	}

	/**
	* Register a new Addon
	*
	* @param	array $addons The existing sources
	* @return	array The new addon list
	* @since 	Version 0.0.6
	*/
	function lg_addon_update_register_addon($addons)
	{
		global $EXT;
		// -- Check if we're not the only one using this hook
		if($EXT->last_call !== FALSE)
			$addons = $EXT->last_call;

		// add a new addon
		// the key must match the id attribute in the source xml
		// the value must be the addons current version
		if($this->settings['check_for_updates'] == 'y')
		{
			$addons[LG_DM_addon_id] = $this->version;
		}

		return $addons;
	}

	/**
	* Encodes a string
	* 
	* @param $str string The unencoded or partially encoded string
	* @return string A html encoded string
	**/
	function _encode($str)
	{
		global $PREFS, $REGX;
		return str_replace(array("'","\""), array("&#39;","&quot;"), $REGX->ascii_to_entities($REGX->_html_entity_decode($str, "UTF-8")));
	}
}

?>