<?php require_once 'core/init.php'; ?>

<?php
if (isset($_POST['apply_coupon'])) {
	$coupon_code = $getFromU->checkInput(strtoupper($_POST['coupon_code']));

	if (!empty($coupon_code)) {

		$get_coupons = $getFromU->view_coupon_by_coupon_code($coupon_code);
		$count_coupon = count($get_coupons);

		if ($count_coupon === 1) {

			foreach ($get_coupons as $get_coupon) {

				$product_id = $get_coupon->product_id;
				$coupon_price = $get_coupon->coupon_price;
				$coupon_limit = $get_coupon->coupon_limit;
				$coupon_used = $get_coupon->coupon_used;
			}

			if ($coupon_limit == $coupon_used) {

				$coupon_error_msg = "Your Coupon Code has been Expired";
			} else {

				$ip_add = $getFromU->getRealUserIp();

				$check_cart = $getFromU->check_product_by_ip_id($ip_add, $product_id);

				if ($check_cart == 1) {
					$update_used = $getFromU->update_used_coupon($coupon_code);

					if ($update_used) {
						$update_cat = $getFromU->update_cart_price($product_id, $ip_add, $coupon_price);

						if ($update_cat) {
							$coupon_success_msg = "Your Coupon Code has been Applied";
						}
					}
				} else {
					$coupon_error_msg = "Product does not Exits in Cart";
				}
			}
		} else {
			$coupon_error_msg = "You have used an Invalid Coupon Code";
		}
	} else {
		$coupon_error_msg = "Please Enter a valid Coupon Code";
	}
}

?>

<?php require_once 'includes/header.php'; ?>

<nav class="navbar navbar-expand-lg  navbar-light bg-dark sticky-top" id="navbar">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto text-light text-uppercase">
			<li>
				<a class="nav-link text-light" href="index.php">Home </a>
			</li>
			<li>
				<a class="nav-link text-light" href="shop.php">Marketplace</a>
			</li>
			<?php if (isset($_SESSION['customer_email'])): ?>
				<li><a class="nav-link text-light" href="customer/my_account.php?my_orders">My Account</a></li>
			<?php else: ?>
				<li><a class="nav-link text-light" href="checkout.php">My Account</a></li>
			<?php endif ?>
			<li>
				<a class="nav-link text-light" href="cart.php">Shopping Cart</a>
			</li>
			<li>
				<a class="nav-link text-light" href="contact.php">Contact Us</a>
			</li>
			<li>
				<a class="nav-link text-light" class="active" href="about.php">About Us</a>
			</li>
			<li>
				<a class="nav-link text-light" href="services.php">Services</a>
			</li>
		</ul>

		<a href="cart.php" class="btn btn-warning ms-3"><i class="fas fa-shopping-cart"></i><span> <?php echo $getFromU->count_product_by_ip($ip_add); ?> items in Cart</span></a>

		<!-- Search Form -->
		<form class="d-flex ms-3" role="search">
			<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="user_query" required="1">
			<button class="btn btn-outline-light" type="submit" name="search">Search</button>
		</form>
	</div>
</nav>

<div id="content">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.php">Home</a></li>
						<li class="breadcrumb-item" aria-current="page">Cart</li>
					</ol>
				</nav>
			</div>

			<div class="col-12">
				<?php if (isset($coupon_error_msg)): ?>
					<div class="alert alert-danger text-center alert-dismissible fade show" role="alert">
						<?php echo $coupon_error_msg; ?>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				<?php endif ?>
			</div>

			<div class="col-12">
				<?php if (isset($coupon_success_msg)): ?>
					<div class="alert alert-success text-center alert-dismissible fade show" role="alert">
						<?php echo $coupon_success_msg; ?>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				<?php endif ?>
			</div>


			<div class="col-md-9">
				<div class="card mb-3">
					<div class="card-body">
						<h5 class="card-title">Shopping Cart</h5>
						<p class="card-text text-muted">You currently have <?php echo $getFromU->count_product_by_ip($ip_add); ?> product(s) in Cart.</p>
						<form method="post" action="cart.php" enctype="multipart/form-data">
							<div class="table-responsive mb-3">
								<table class="table table-bordered table-hover text-center">
									<thead>
										<tr>
											<th colspan="2" scope="col">Product</th>
											<th scope="col" width="20%">Quantity</th>
											<th scope="col">Unit Price ($)</th>
											<th scope="col">Delete</th>
											<th scope="col">Sub Total ($)</th>
										</tr>
									</thead>
									<tbody>

										<?php
										$ip_add = $getFromU->getRealUserIp();
										$total = 0;
										$records = $getFromU->select_products_by_ip($ip_add);
										foreach ($records as $record) {
											$product_id = $record->p_id;
											$product_qty = $record->qty;
											$product_price = $record->product_price;
											$get_prices = $getFromU->viewProductByProductID($product_id);
											foreach ($get_prices as $get_price) {
												$product_img1 = $get_price->product_img1;
												$product_title = $get_price->product_title;
												$sub_total = $product_price * $product_qty;
												$total += $sub_total;

												$_SESSION['product_qty'] = $product_qty;
										?>

												<tr>
													<td>
														<a href="details.php?product_id=<?php echo $product_id; ?>"><img class="img-fluid cart_image" src="admin_area/product_images/<?php echo $product_img1; ?>"></a>
													</td>
													<td>
														<a href="details.php?product_id=<?php echo $product_id; ?>"><?php echo $product_title; ?></a>
													</td>
													<td>
														<input type="number" name="quentity" value="<?php echo $_SESSION['product_qty']; ?>" data-product_id="<?php echo $product_id; ?>" class="quentity form-control">
													</td>
													<td>$ <?php echo $product_price; ?></td>
													<td>
														<div class="custom-control custom-checkbox">
															<input type="checkbox" name="remove[]" value="<?php echo $product_id; ?>" class="custom-control-input" id="checkbox['<?php echo $product_id; ?>']">
															<label class="custom-control-label" for="checkbox['<?php echo $product_id; ?>']"></label>
														</div>
													</td>
													<td class="text-right">$ <?php echo number_format($sub_total, 2); ?></td>
												</tr>
										<?php }
										} ?>

										<tr>
											<th class="text-right" colspan="5"> Total </th>
											<th class="text-right" colspan="1"> $ <?php echo number_format($total, 2); ?></th>
										</tr>

									</tbody>
								</table>

								<div class="form-inline float-right">
									<label class="mr-1" for="coupon">Coupon Code : </label>
									<input type="text" name="coupon_code" class="form-control form-control-sm mr-sm-2" id="coupon" placeholder="Enter Coupon Code">
									<button type="submit" name="apply_coupon" class="btn btn-sm btn-info">Apply Coupon</button>
								</div>

							</div> <!-- Table Responsive End -->


							<div class="card-footer">
								<div class="row">
									<div class="col-lg-3 pr-1 pb-2">
										<a href="index.php" class="btn btn-outline-primary form-control"><i class="fas fa-chevron-left"></i> Continue Shopping</a>
									</div>
									<!-- <div class="col-lg-2 pr-1 pb-2"> -->
									<!-- <a href="index.php" class="btn btn-outline-danger form-control"><i class="fas fa-shopping-cart"></i> Empty</a>
									</div> -->
									<div class="col-lg-3 pr-lg-3 pr-1 pb-2">
										<button class="btn btn-outline-info float-sm-right form-control" type="submit" name="update" value="Update Cart">
											<i class="fas fa-sync-alt"></i> Update Cart
										</button>
									</div>
									<div class="col-lg-4  pr-lg-3 pr-1 ">
										<a href="checkout.php" class="btn btn-outline-success form-control">Proceed to Checkout <i class="fas fa-chevron-right"></i></a>
									</div>
								</div>
							</div>
						</form> <!-- Form End -->

						<?php
						if (isset($_POST['update']) && !empty($_POST['update'])) {
							if (!empty($_POST['remove'])) {
								$product_ids = $_POST['remove'];
								foreach ($product_ids as $product_id) {
									$delete_id = $getFromU->delete_from_cart_by_id($product_id);
								}
								if ($delete_id) {
									//header('Location: cart.php');
									echo '<script>alert("Item(s) Deleted Sucessfully")</script>';
									echo '<script>window.open("cart.php", "_self")</script>';
								}
							}
						}
						?>
					</div>
				</div>
			</div> <!-- col-md-9 End -->

			<div class="col-md-3">
				<div class="card">
					<h5 class="card-header text-center">Order Summary</h5>
					<div class="card-body">
						<p class="card-text text-muted text-justify">With supporting text below as a natural lead-in to additional content.</p>
						<table class="table table-hover text-center">
							<thead>
								<tr>
									<th scope="col">Heading</th>
									<th scope="col">Price</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Price</td>
									<td class="text-right">$ <?php echo number_format($total, 2); ?></td>
								</tr>
								<tr>
									<td>Tax</td>
									<td class="text-right">$ <?php echo number_format($tax = ($total * 5) / 100, 2); ?></td>
								</tr>
								<tr>
									<td>Shipping</td>
									<td class="text-right">$ <?php echo number_format($shipping = ($total * 4.5) / 100, 2); ?></td>
								</tr>
								<tr>
									<th>Total</th>
									<th class="text-right">$ <?php echo number_format($total + $tax + $shipping, 2); ?></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="row suggestion_heading mb-4">
				<div class="col-md-12">
					<div class="text-center">
						<h2 class="font-weight-bold" style="font-size: 2rem; letter-spacing: 1px;">You May Also Like This</h2>
					</div>
				</div>
			</div>

			<div class="row">
				<?php
				$random_products = $getFromU->select_random_products();
				foreach ($random_products as $random_product) {
					$product_title = $random_product->product_title;
					$product_id = $random_product->product_id;
					$product_img1 = $random_product->product_img1;
					$product_price = $random_product->product_price;
					$product_label = $random_product->product_label;
					$prod_customer_id = $random_product->customer_id;
					$product_psp_price = $random_product->product_psp_price;

					$customer = $getFromU->view_customer_by_id($prod_customer_id);
					@$prcustomer_name = $customer->customer_name;
					if ($prcustomer_name == null) {
						$prcustomer_name = "Admin";
					}

					if ($product_label == "Sale" || $product_label == "Gift") {
						$product_price = "<del>$$product_price</del>";
						$product_psp_price = "<i class='fas fa-long-arrow-alt-right'></i> $$product_psp_price";
					} else {
						$product_price = "$$product_price";
						$product_psp_price = "";
					}

				?>
					<div class="col-sm-6 col-md-3 justify-content-center single">
						<div class="product mb-4">
							<div class="card">
								<a href="details.php?product_id=<?php echo $product_id; ?>"><img class="card-img-top img-fluid p-3" src="admin_area/product_images/<?php echo $product_img1; ?>" alt="Card image cap"></a>
								<div class="card-body text-center">
									<a href="user_profile.php?user=<?php echo $prod_customer_id; ?>" class="btn btn-sm btn-info mb-0">Mnf By : <?php echo $prcustomer_name; ?></a>
									<hr>
									<h6 class="card-title"><a href="details.php?product_id=<?php echo $product_id; ?>"><?php echo $product_title; ?></a></h6>
									<p class="card-text"><?php echo $product_price; ?> <?php echo $product_psp_price; ?></p>
									<div class="row">
										<div class="col-md-6  pr-1 pb-2">
											<a href="details.php?product_id=<?php echo $product_id; ?>" class="btn btn-outline-info form-control">Details</a>
										</div>
										<div class="col-md-6  pr-lg-3 pr-1">
											<a href="details.php?product_id=<?php echo $product_id; ?>" class="btn btn-success form-control"><i class="fas fa-shopping-cart"></i> Add</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<?php if (!empty($product_label)): ?>
							<a class="label sale" style="color: black">
								<div class="thelabel"><?php echo $product_label; ?></div>
								<div class="label-background"></div>
							</a>
						<?php endif ?>
					</div> <!-- SINGLE PRODUCT END -->

				<?php } ?>

			</div> <!-- SINGLE PRODUCT ROW END -->

		</div>
	</div>


	<?php require_once 'includes/footer.php'; ?>

	<script>
		$(document).ready(function(data) {
			$(document).on('keyup', '.quentity', function() {
				var id = $(this).data("product_id");
				var quentity = $(this).val();

				if (quentity != '') {
					$.ajax({
						url: "change.php",
						method: "POST",
						data: {
							id: id,
							quentity: quentity
						},
						success: function(data) {
							$("body").load('cart_body.php');
						}
					});
				}

			});
		});
	</script>