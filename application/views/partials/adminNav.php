<!-- Sidebar  -->
<nav class="navbar fixed-top navbar-light bg-light pt-0 pb-0">
  <a class="navbar-brand" href="<?php echo base_url(); ?>"><img src="<?php echo base_url() . 'assets/image/pgi-wellness.png'; ?>" alt=""></a>
  <div class="form-inline my-2 my-lg-0">
    <!-- <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"> -->
    <i class="fas fa-user mr-sm-2"></i>
    <span class="my-2 my-sm-0 pr-3">WELCOME <?php echo strtoupper($this->session->username); ?></span>
  </div>
</nav>
<nav id="sidebar" class="mt-64px">
  <!-- <div class="sidebar-header">
    <div class="row">
      <div class="col-12"><img src="<?php echo base_url('assets/image/logopgi.png') ?>"></div>
    </div>
  </div> -->
  <ul class="list-unstyled components">
      <li>
        <a href="<?php echo base_url(); ?>" class="font-12"><i class="fas fa-barcode"></i> DASHBOARD</a>
      </li>
      <li class="">
				<a href="#ordersMenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fas fa-tasks"></i> ORDERS</a>
				<ul class="collapse list-unstyled" id="ordersMenu">
					<li>
            <a href="<?php echo base_url(); ?>">Orders List</a>
					</li>
					<li>
            <a href="<?php echo base_url(); ?>">Abandoned Checkout</a>
					</li>
				</ul>
      </li>
      <li class="">
				<a href="#productsMenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fas fa-tasks"></i> PRODUCTS</a>
				<ul class="collapse list-unstyled" id="productsMenu">
					<li>
            <a href="<?php echo base_url() . 'all-products'; ?>">All Products</a>
					</li>
					<li>
            <a href="<?php echo base_url(); ?>">Inventory</a>
					</li>
          <li>
            <a href="<?php echo base_url(); ?>categories">Categories</a>
          </li>
          <li>
            <a href="<?php echo base_url(); ?>">Suppliers</a>
          </li>
          <li>
            <a href="<?php echo base_url(); ?>">Product Types</a>
          </li>
          <li>
            <a href="<?php echo base_url(); ?>">Product Images</a>
          </li>
          <li>
            <a href="<?php echo base_url(); ?>">Order Details</a>
          </li>
				</ul>
      </li>
      <li><a href=""><i class="fas fa-user-friends"></i> CUSTOMERS</a></li>
      <li><a href=""><i class="fas fa-tags"></i> DISCOUNTS/PROMOS</a></li>
      <li><a href=""><i class="fas fa-clipboard-list"></i> REPORTS</a></li>
      <li class="bottom-nav" style="bottom: 44px;">
        <a href="<?php echo base_url(); ?>settings" class="font-12 <?php //echo $logged_in->level == 1 ? 'd-none' : ''; ?>"><i class="fas fa-cog"></i> SETTINGS</a>
      </li>
      <li class="bottom-nav"><a class="nav-link" href="<?php echo base_url() . $go_logout; ?>"><i class="fas fa-sign-out-alt"></i> LOGOUT</a></li>
  </ul>
</nav>

        <!-- Page Content  -->
<div id="content" class="mt-64px">
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
    <div class="container-fluid">
        <button type="button" id="sidebarCollapse" class="btn btn-default mr-3">
            <i class="fas fa-align-left"></i>
            <!-- <span>Toggle Sidebar</span> -->
        </button>
        <!-- <button class="btn btn-dark d-inline-block d-lg-none ml-auto " type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-align-justify"></i>
        </button> -->
        <h4 class="mb-0 mt-2" id="badge-heading"><?php echo $heading; ?></h4>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="nav navbar-nav ml-auto">
                <li class="nav-item active">
                  <!-- <a class="nav-link" href="<?php //echo base_url('settings'); ?>"><i class="fas fa-cog"></i> Settings</a> -->
                </li>
                <!-- <li class="nav-item active">
                  <a class="nav-link" href="<?php echo base_url() . $go_logout; ?>"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </li> -->
            </ul>
        </div>
    </div>
</nav>

