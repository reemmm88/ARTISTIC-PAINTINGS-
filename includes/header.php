<?php require_once('core/init.php'); ?>

<?php
$ip_add = $getFromU->getRealUserIp();
$total = 0;
$records = $getFromU->select_products_by_ip($ip_add);
foreach ($records as $record) {
	$product_id = $record->p_id;
	$product_price = $record->product_price;
	$product_qty = $record->qty;
	$get_prices = $getFromU->viewProductByProductID($product_id);
	foreach ($get_prices as $get_price) {
		$sub_total = $product_price * $product_qty;
		$total += $sub_total;
	}
}
// $customers = $getFromU->view_customer_by_email($_SESSION['customer_email']);
// $customer_disability = $customers->$is_artist;
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.css" rel="stylesheet">
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- PLUGINS STYLES-->
	<link href="assets/css/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
	<!-- Font Awesome CSS -->
	<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

	<link rel="stylesheet" type="text/css" href="assets/css/sweetalert.css">

	<link rel="stylesheet" type="text/css" href="assets/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="assets/css/main.css">

	<script src='https://www.google.com/recaptcha/api.js'></script>

	<title>ART-FOR-ALL</title>
</head>

<body>

	<div id="top" class="bg-dark text-light py-2"> <!-- Top Starts -->
		<div class="Container"> <!-- Container Starts -->
			<div class="row d-flex justify-content-between"> <!-- row Starts -->


				<div class="col-md-6 offer"> <!-- col-md-6 offer Starts -->
					<object type="image/svg+xml" data="includes/logo.svg" style="direction:abslute;" class="logo"></object>
					<a href="customer/my_account.php?my_profile" class="btn btn-info btn-sm">
						<?php
						if (!isset($_SESSION['customer_email'])) {
							echo 'Welcome : Guest';
						} else {
							$customer = $getFromU->view_customer_by_email($_SESSION['customer_email']);
							@$customer_name = $customer->customer_name;
							@$customer_disability = $customer->is_artist;
							echo "Welcome <strong class='text-uppercase'>$customer_name</strong>";
						}
						?>
					</a>

				</div> <!-- col-md-6 offer Ends -->

				<div class="col-md-6 "> <!-- col-md-6 Starts -->
					<ul class="menu"> <!-- menu starts -->
						<?php if (@$customer_disability == "1"): ?>
							<li><a href="insert_products.php">Add Products</a></li>
						<?php endif; ?>
						<li><a href="cart.php">Go To Cart</a></li>

						<li>
							<?php if (!isset($_SESSION['customer_email'])): ?>
								<a href="checkout.php">Login</a>
							<?php else: ?>
								<a href="logout.php">Logout</a>
							<?php endif ?>
						</li>
					</ul> <!-- menu ends -->
				</div> <!-- col-md-6 Ends -->
			</div><!-- row ends -->


		</div> <!-- Container Ends -->
	</div> <!-- Top Ends -->