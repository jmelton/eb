/**
* JS for for LG Data Matrix
* 
* This file must be placed in the
* /themes/cp_themes/default/lg_data_matrix/js/ folder in your ExpressionEngine installation.
*
* @package LgDataMatrix
* @version 1.1.1
* @author Leevi Graham <http://leevigraham.com>
* @author Brandon Kelly <me@brandon-kelly.com>
* @see http://leevigraham.com/cms-customisation/expressionengine/addon/lg-data-matrix/
* @copyright Copyright (c) 2007-2009 Leevi Graham
* @license {@link http://creativecommons.org/licenses/by-sa/3.0/ Creative Commons Attribution-Share Alike 3.0 Unported} All source code commenting and attribution must not be removed. This is a condition of the attribution clause of the license.
* @requires jQuery 1.2.6
* @requires jQuery UI 1.5.2
*/

(function($) {

$.fn.dataMatrix = function() {
	return this.each(function() {
		var $obj = $(this);
		
		// Get col types
		$obj._cellTypes = [];
		$('> div.row:nth-child(2) > div.cell', $obj).each(function(cell) {
			$obj._cellTypes.push(/lgdm-(\w+)/.exec($(this).attr('class'))[1]);
		});

		$obj
			.sortable({
				axis:'y',
				containment:'parent',
				cursor:'move',
				handle:'.sort-handle',
				items:'> div',
				opacity: 0.8,
				start:function(e, ui){
					ui.helper.css('width', $obj.css('width'));
				},
				stop:function(){
					dataMatrix.setRowColors($obj);
					dataMatrix.updateInputNames($obj);
				}
			})
			.find('a.delete')
				.click(function(e) {
					if(!confirm('Are you sure you want to delete this row?')) return;
					if($('.row', $obj).length > 1) {
						$(e.target).parent().remove();
						dataMatrix.setRowColors($obj);
						dataMatrix.updateInputNames($obj);
					}
					return false;
				})
				.end()
			.next()
				.click(function(){
					var $clone = $obj.find('> div:last-child').clone(true);
					$('input[type=text], select', $clone).val('');
					$('textarea', $clone).html('');
					$('input[type=checkbox]', $clone).attr('checked', '');
					$obj.append($clone);
					dataMatrix.setRowColors($obj);
					dataMatrix.updateInputNames($obj);
					/*
					$('.date-picker').datepicker( "destroy" ).datepicker({
						dateFormat: "yy-mm-dd '" + date_obj_time +"'",
						showButtonPanel: true,
						showAnim: 'fadeIn'
					});
					*/
				});
	});
};


var dataMatrix = {
	setRowColors: function($obj) {
		$('> div.row:odd', $obj).attr('class', 'row tableCellTwo');
		$('> div.row:even', $obj).attr('class', 'row tableCellOne');
	},
	updateInputNames: function($obj) {
		$('> div.row', $obj).each(function(rowIndex) {
			var $row = $(this);
			$('> div.cell', $row).each(function(cellIndex) {
				var $cell = $(this),
					cellType = $obj._cellTypes[cellIndex],
					input;
				
				// Get the input
				switch(cellType) {
					case 'text':     input = 'input'; break;
					case 'textarea': input = 'textarea'; break;
					case 'select':   input = 'select'; break;
					case 'date':     input = 'input'; break;
					case 'checkbox': input = 'input'; break;
					default: input = 'input';
				}
				$input = $(input, $cell);
				
				// Update name
				var prevName = $input.attr('name');
				if (prevName) {
					var name = /^(.*\[)\d+\]$/.exec(prevName)[1] + rowIndex + ']';
					$input.attr('name', name);
				}
			});
		});
	}
};
/*
date_obj_time = (function(date) {
	return (function(hr, mn) {
		return '' +
		('0' + ((hr % 12) || 12)).replace(/.*(\d\d)$/, '$1') + ':' +
		('0' + mn).replace(/.*(\d\d)$/, '$1') +
		(hr > 11 ? ' PM' : ' AM');
	})(date.getHours(), date.getMinutes());
})(new Date());
*/
$(document).ready(function () {
	$('.lg_multi-text-field').dataMatrix();
/*
	$('.lg_multi-text-field .date-picker').datepicker({
		dateFormat: "yy-mm-dd '" + date_obj_time +"'",
		showButtonPanel: true,
		showAnim: 'fadeIn'
	});
*/
});


})(jQuery);