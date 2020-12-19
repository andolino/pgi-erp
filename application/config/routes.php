<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] 	      = 'Admin';
$route['settings'] 						      = 'Settings/show_settings';
$route['user-control'] 						  = 'Settings/user_control';
$route['view-users'] 					      = 'Settings/view_users';
$route['view-user-types'] 		      = 'Settings/users_types';
$route['view-modules'] 		          = 'Settings/view_modules';
$route['view-user-access-level'] 		= 'Settings/view_user_access_level';
$route['server-users'] 	            = 'Settings/server_users';
$route['server-user-type'] 	        = 'Settings/server_user_type';
$route['server-modules'] 	          = 'Settings/server_modules';
$route['server-user-access-level'] 	= 'Settings/server_user_access_level';
$route['get-users-frm'] 	          = 'Settings/getUsersFrm';
$route['get-user-type-frm'] 	      = 'Settings/getUserTypeFrm';
$route['get-module-frm'] 	          = 'Settings/getModuleFrm';
$route['get-user-access-level-frm'] = 'Settings/getUserAccessLevelFrm';

$route['logout'] 							= 'Admin/destroy_sess';
$route['login'] 							= 'Admin/usr_login';
$route['forgot-password'] 		= 'Admin/forgot_password';
$route['submit-login'] 				= 'Admin/proceed_login';
$route['submit-forgot-pw'] 		= 'Admin/proceed_fg_pw';

$route['get-users-frm-fp'] 	  = 'Settings/getUsersFrmFp';
$route['save-users-data'] 	  = 'Settings/saveUsersData';
$route['view-setting-page'] 	= 'Settings/view_settings_page';
$route['get-user-role-frm'] 	= 'Settings/getUserRoleFrm';
$route['add-data']  	        = 'Settings/addData';

$route['all-products'] 		    = 'Products/all_products';
$route['add-products'] 		    = 'Products/addProductsFrm';
$route['add-categories'] 		    = 'Products/addCategoriesFrm';
$route['save-products'] 		  = 'Products/saveProducts';
$route['server-all-products'] = 'Products/server_all_products';
$route['categories'] = 'Products/view_categories';
$route['server-all-categories'] = 'Products/server_all_categories';



//CRUD
$route['delete-data'] 	= 'Settings/deleteData';


$route['404_override'] 					= '';
$route['translate_uri_dashes'] 	= FALSE;
