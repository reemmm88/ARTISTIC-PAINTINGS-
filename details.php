<?php require_once 'includes/header.php'; ?>

<?php
if (isset($_POST['add_to_wishlist'])) {
	if (!isset($_SESSION['customer_email'])) {
		header('Location: checkout.php');
	} else {
		$customer_email = $_SESSION['customer_email'];

		$get_customer = $getFromU->view_customer_by_email($customer_email);

		$customer_id = $get_customer->customer_id;

		$product_id = $getFromU->checkInput($_GET['product_id']);


		$check_wishlist = $getFromU->check_wishlist_by_customer_id_and_product_id($customer_id, $product_id);

		if ($check_wishlist === true) {
			$error = "This Product is already in Wishlist";
		} else {
			$insert_wishlist = $getFromU->create('wishlist', array('customer_id' => $customer_id, 'product_id' => $product_id));
			if ($insert_wishlist) {
				$insert_wishlist_msg = "Product inserted successfully to wishlist";
			}
		}
	}
}
?>

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

			<?php
			if (isset($_GET['product_id'])) {
				$the_product_id = $_GET['product_id'];

				$get_products = $getFromU->viewProductByProductID($the_product_id);
				//var_dump($get_products);

				foreach ($get_products as $get_product) {
					$cat_id          = $get_product->cat_id;
					$product_title     = $get_product->product_title;
					$product_price     = $get_product->product_price;
					$product_desc      = $get_product->product_desc;
					$product_img1      = $get_product->product_img1;
					$product_label     = $get_product->product_label;
					$product_psp_price = $get_product->product_psp_price;
					$status            = $get_product->status;
					$pro_customer_id	   = $get_product->customer_id;

					if ($status == "product") {
						$title = "Product";
					} elseif ($status == "bundle") {
						$title = "Bundle";
					}

					if ($product_label == "Sale" || $product_label == "Gift" || $product_label == "Bundle") {
						$product_price = "<del>$$product_price</del>";
						$product_psp_price = "$$product_psp_price";
					} else {
						$product_price = "$$product_price";
						$product_psp_price = "";
					}

					$get_p_cats = $getFromU->viewAllByCatID($cat_id);
					foreach ($get_p_cats as $get_p_cat) {
						$cat_id = $get_p_cat->cat_id;


						if (isset($_POST['submit'])) {
							//Verifying CSRF Token
							$name = $_POST['name'];
							$email = $_POST['email'];
							$comment = $_POST['comment'];
							$postid = $the_product_id;
							$st1 = '0';

							$insert_comment = $getFromU->create("tblcomments", array("postId" => $postid, "postingDate" => date("Y-m-d H:i:s"), "name" => $name, "comment" => $comment, "email" => $email, "status" => $st1));

							if ($insert_comment) {
								echo '<script>alert("comment has been added Sucessfully")</script>';
								echo '<script>window.open("index.php?add_product", "self")</script>';
							} else {
								echo '<script>alert("comment has not added")</script>';
							}
						}
					}


			?>




					<div class="col-md-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.php">Home</a></li>
								<li class="breadcrumb-item"><a href="shop.php">Marketplace</a></li>
								<li class="breadcrumb-item" aria-current="page"><?php echo $product_title; ?></li>
							</ol>
						</nav>
					</div>


					<?php if (isset($error)) : ?>
						<div class="col-md-12">
							<div class="alert alert-danger text-center alert-dismissible fade show" role="alert">
								<?php echo $error; ?>
								<button type="button" class="close" data-dismiss="alert" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					<?php endif ?>

					<?php if (isset($insert_wishlist_msg)) : ?>
						<div class="col-md-12">
							<div class="alert alert-success text-center alert-dismissible fade show" role="alert">
								<?php echo $insert_wishlist_msg; ?>
								<button type="button" class="close" data-dismiss="alert" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</div>
					<?php endif ?>


					<div class="col-md-12">
						<div class="row" id="productMain">
							<div class="col-sm-6">
								<div id="mainImage">
									<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
										<ol class="carousel-indicators">
											<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
											<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
											<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
										</ol>
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img class="d-block w-100 img-fluid" src="admin_area/product_images/<?php echo $product_img1; ?>" alt="First slide">
											</div>
										</div>
										<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a>
										<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
									</div>
								</div>
								<?php if (!empty($product_label)) : ?>
									<a class="label sale" style="color: black">
										<div class="thelabel"><?php echo $product_label; ?></div>
										<div class="label-background"></div>
									</a>
								<?php endif ?>
							</div>

							<div class="col-sm-6">
								<div class="card text-center mb-3">
									<div class="card-body">
										<h4 class="card-title mb-4"><?php echo $product_title; ?></h4>
										<?php

										if (isset($_POST['add_to_cart'])) {
											$p_id = $_POST['product_id'];
											$ip_add = $getFromU->getRealUserIp();
											$product_qty = $_POST['product_qty'];

											$get_product = $getFromU->view_Product_By_Product_ID($p_id);
											$product_price = $get_product->product_price;
											$product_psp_price = $get_product->product_psp_price;
											$product_label = $get_product->product_label;
											$icustomer_id = $get_product->customer_id;

											@$get_image = $getFromU->view_customer_by_id($customer_id);
											@$user_image = $get_image->customer_image;

											$check_product_by_ip_id = $getFromU->check_product_by_ip_id($ip_add, $p_id);

											if ($check_product_by_ip_id === true) {
												echo '<script>alert("This product is already added in cart")</script>';
											} else {

												if ($product_label == "Sale" || $product_label == "Gift" || $product_label == "Bundle") {
													$product_price = $product_psp_price;
												} else {
													$product_price = $product_price;
												}

												$insert_cart = $getFromU->create("cart", array("p_id" => $p_id, "ip_add" => $ip_add, "qty" => $product_qty, "product_price" => $product_price));
												echo '<script>alert("This product added successfully in cart")</script>';
												header('Location: shop.php');
											}
										}


										?>
										<form method="post">
											<div class="form-group row">
												<label for="product_qty" class="col-sm-5 col-form-label-sm text-xl-right"> Quantity</label>
												<div class="col-sm-7">
													<select name="product_qty" id="product_qty" class="form-control">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
														<option value="6">6</option>
													</select>
												</div>
											</div>



											<div class="form-group row mb-0">
												<div class="col-sm-7">
													<input type="hidden" name="product_id" value="<?php echo $the_product_id; ?>">
												</div>
											</div>

											<div class='mb-3 center'>
												<?php
												$get_image = $getFromU->view_Product_By_Product_ID($_GET['product_id']);
												$userID = $get_image->customer_id;
												$get_image = $getFromU->view_customer_by_id($userID);
												$user_image = $get_image->customer_image;
												if (@$user_image == ""):
													@$user_image = "admin-avatar.png"; ?>
												<?php endif; ?>
												<img src="customer/assets/customer_images/<?php echo $user_image; ?>" width="45" height="45">
											<?php } ?>

											</div>
											<?php
											$customer = $getFromU->view_customer_by_id($pro_customer_id);
											@$pcustomer_name = $customer->customer_name;
											if ($pcustomer_name == NULL) {
												$pcustomer_name = "Admin";
											}
											?>
											<a href="user_profile.php?user=<?php echo $pro_customer_id; ?>" class="btn btn-sm btn-info mb-0">Manufacturer : <?php echo $pcustomer_name; ?></a>

											<h6 class="card-text mt-4">Price : <?php echo $product_price; ?></h6>
											<?php if ($product_label == "Sale" || $product_label == "Gift" || $product_label == "Bundle") : ?>
												<h6 class="card-text ">Discount Price : <?php echo $product_psp_price; ?></h6>
											<?php endif ?>

											<button type="submit" name="add_to_cart" class="card-link btn btn-outline-info mt-3 px-4"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
											<button type="submit" name="add_to_wishlist" class="card-link btn btn-outline-danger mt-3 px-4"><i class="fas fa-heart"></i> Add to Wishlist</button>

										</form>


									</div>
								</div>


								<div class="row" id="thumbs">
									<div class="col-4">
										<a href="#" class="thumb"><img class="img-fluid img-thumbnail" src="admin_area/product_images/<?php echo $product_img1; ?>"></a>
									</div>
								</div>

							</div>

						</div>

						<div class="row my-4">
							<div class="col-12">
								<div class="card">
									<div class="card-body">

										<ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
											<li class="nav-item">
												<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><?php echo $product_title; ?> Description</a>
											</li>
										</ul>
										<div class="tab-content" id="myTabContent">
											<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
												<h5 class="card-title"><?php echo $product_title; ?> Details</h5>
												<p class="card-text"><?php echo $product_desc; ?></p>

											</div>
										</div>



									</div>
								</div>
							</div>
						</div>

					</div> <!-- col-md-9 END --3 -->
				<?php }

				?>
		</div> <!-- Row end -->

		<?php  ?>

		<div class="row suggestion_heading">
			<div class="col-md-12 ">
				<div class="text-center">
					<h2 class="">You may also Like this</h2>
				</div>
			</div>
		</div>

		<div class="row">
			<?php
			//var_dump($cat_id);
			$view_products = $getFromU->viewProductByProductID($the_product_id);
			//var_dump($products);
			foreach ($view_products as $view_product) {
				$cat_id = $view_product->cat_id;
				//var_dump($cat_id);
				$products = $getFromU->viewProductByCatID($cat_id);
				foreach ($products as $product) {
					$product_id = $product->product_id;
					$product_title = $product->product_title;
					$product_price = $product->product_price;
					$product_img1 = $product->product_img1;
					$product_label   = $product->product_label;
					$product_psp_price = $product->product_psp_price;
					$prod_customer_id = $product->customer_id;
					$customer = $getFromU->view_customer_by_id($prod_customer_id);
					@$prcustomer_name = $customer->customer_name;
					if ($prcustomer_name == NULL) {
						$prcustomer_name = "Admin";
					}

					if ($product_label == "Sale" || $product_label == "Gift") {
						$product_price = "<del>$$product_price</del>";
						$product_psp_price = "<i class='fas fa-long-arrow-alt-right'></i> $$product_psp_price";
					} else {
						$product_price = "$$product_price";
						$product_psp_price = "";
					}

					if ($product_id == $the_product_id) {
						continue;
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
						<?php if (!empty($product_label)) : ?>
							<a class="label sale" style="color: black">
								<div class="thelabel"><?php echo $product_label; ?></div>
								<div class="label-background"></div>
							</a>
						<?php endif ?>
					</div> <!-- SINGLE PRODUCT END -->

			<?php  }
			} ?>
			<div class="col-md-8">
				<?php
				$pid = intval($_GET['product_id']);
				$sts = 1;
				$view_comments = $getFromU->view_comment_by_product_id($pid, $sts);

				foreach ($view_comments as $comment) {
				?>
					<div class="media mb-4">
						<img class="d-flex mr-3 rounded-circle" src="assets/images/usericon.png" alt="">
						<div class="media-body">
							<h5 class="mt-0"><?php echo htmlentities($comment->name); ?> <br />
								<span style="font-size:11px;"><b>at</b> <?php echo htmlentities($comment->postingDate); ?></span>
							</h5>
							<?php echo htmlentities($comment->comment); ?>
						</div>
					</div>
				<?php } ?>
				<!---Comment Section --->
			</div>
			<div class="col-md-8">
				<hr>
				<div class="card my-4 bg-transparent border-0">
					<h5 class="card-header bg-transparent border-0">Leave a Comment</h5>
					<div class="card-body">
						<form name="Comment" method="post">
							<div class="form-group">
								<input type="text" name="name" class="form-control rounded-0" placeholder="Enter your fullname" required>
							</div>
							<div class="form-group">
								<input type="email" name="email" class="form-control rounded-0" placeholder="Enter your Valid email" required>
							</div>
							<div class="form-group">
								<textarea class="form-control rounded-0" name="comment" rows="3" placeholder="Comment" required></textarea>
							</div>
							<button type="submit" class="btn btn-danger" name="submit">Submit</button>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>


	<?php require_once 'includes/footer.php'; ?>