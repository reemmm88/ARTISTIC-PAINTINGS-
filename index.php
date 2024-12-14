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
<style>
	#slider {
		margin: 0;
		padding: 0;
	}

	.carousel-item {
		position: relative;
		/* تمكين وضع الطبقة فوق الصورة */
	}

	.image-overlay {
		position: relative;
	}

	.image-overlay img {
		max-height: 700px;
		/* ارتفاع مناسب للشاشة */
		width: 100%;
		object-fit: cover;
	}

	.image-overlay::before {
		content: "";
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.4);
		/* طبقة سوداء شفافة */
	}

	.carousel-caption {
		position: absolute;
		bottom: 20px;
		left: 50%;
		transform: translateX(-50%);
		background: rgba(0, 0, 0, 0.6);
		padding: 25px;
		border-radius: 10px;
		max-width: 70%;
		text-align: center;
	}

	.carousel-caption h5 {
		font-size: 1rem;
		font-weight: bold;
	}

	.carousel-caption p {
		font-size: 1.5rem;
		line-height: 1.5;
	}
</style>

<div class="container-fluid px-0" id="slider">
	<div class="row">
		<div class="col-md-12">
			<!-- carousel slide starts -->
			<div id="carouselExampleIndicators" class="carousel slide image-overlay" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner">
					<?php
					$slides = $getFromU->selectSlide1();
					foreach ($slides as $slide) {
						$slide_image = $slide->slide_image;
						$slide_name  = $slide->slide_name;
						$slide_title  = $slide->slide_title;
						$slide_text  = $slide->slide_text;
					?>
						<div class="carousel-item active image-overlay">
							<div target="_blank"><img class="d-block w-100 img-fluid" src="admin_area/slides_images/<?php echo $slide_image; ?>" alt="<?php echo $slide_name; ?>"></div>
							<div class="carousel-caption d-none d-md-block">
								<h5><?php echo $slide_title; ?></h5>
								<p><?php echo $slide_text; ?></p>
							</div>
						</div>

					<?php } ?>

					<?php
					$slides = $getFromU->selectSlideAll();
					foreach ($slides as $slide) {
						$slide_image = $slide->slide_image;
						$slide_name  = $slide->slide_name;
						$slide_title  = $slide->slide_title;
						$slide_text  = $slide->slide_text;
					?>
						<div class="carousel-item image-overlay">
							<div target="_blank"><img class="d-block w-100 img-fluid" src="admin_area/slides_images/<?php echo $slide_image; ?>" alt="<?php echo $slide_name; ?>"></div>
							<div class="carousel-caption d-none d-md-block">
								<h5><?php echo $slide_title; ?></h5>
								<p><?php echo $slide_text; ?></p>
							</div>
						</div>
					<?php } ?>

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
			<!-- carousel slide ends -->
		</div>
	</div>
</div>


<div class="container mt-5 advantages"> <!-- advantages starts -->
	<div class="row">
		<?php
		$view_boxes = $getFromU->viewAllFromTable('boxes_section');
		foreach ($view_boxes as $view_box) {
			$box_title = $view_box->box_title;
			$box_desc = $view_box->box_desc;
		?>

			<div class="col-sm-12 col-md-4 mb-4">
				<div class="card shadow-lg border-light rounded-lg overflow-hidden">
					<div class="card-body text-center">
						<h5 class="card-title text-uppercase text-primary"><?php echo $box_title; ?></h5>
						<p class="card-text text-muted"><?php echo $box_desc; ?></p>
					</div>
				</div>
			</div>

		<?php } ?>
	</div>
</div> <!-- advantages ends -->

<div id="hot">
	<div class="container-fluid mt-4 px-0">
		<div class="row">
			<div class="col-12">
				<h2 class="p-4 bg-info text-white text-center text-uppercase rounded">Latest This Week</h2>
			</div>
		</div>
	</div>

</div>
<div class="container" id="content">
	<div class="row">

		<?php
		$getProducts         = $getFromU->selectLatestProduct();
		foreach ($getProducts as $getProduct) {
			$product_id        = $getProduct->product_id;
			$product_title     = $getProduct->product_title;
			$product_price     = $getProduct->product_price;
			$product_img1      = $getProduct->product_img1;
			$product_label     = $getProduct->product_label;
			$product_psp_price = $getProduct->product_psp_price;
			$customer_id = $getProduct->customer_id;

			if ($product_label == "Sale" || $product_label == "Gift") {
				$product_price = "<del>$$product_price</del>";
				$product_psp_price = "<i class='fas fa-long-arrow-alt-right'></i> $$product_psp_price";
			} else {
				$product_price = "$$product_price";
				$product_psp_price = "";
			}
			$view_customer = $getFromU->view_customer_by_id($customer_id);
			@$the_customer_name = $view_customer->customer_name;
			if ($the_customer_name == NULL) {
				$the_customer_name = "Admin";
			}
		?>

			<div class="col-sm-6 col-md-4 col-lg-3 single">
				<div class="product mb-4">
					<div class="card rounded">
						<a href="details.php?product_id=<?php echo $product_id; ?>"><img class="card-img-top img-fluid px-4 pt-4 rounded" src="admin_area/product_images/<?php echo $product_img1; ?>" alt="Card image cap"></a>
						<div class="card-body text-center">
							<a href="user_profile.php?user=<?php echo $customer_id; ?>" class="btn btn-sm btn-info mb-0">Mnf By : <?php echo $the_customer_name; ?></a>
							<hr>
							<h6 class="card-title"><a href="details.php?product_id=<?php echo $product_id; ?>"><?php echo $product_title; ?></a></h6>
							<p class="card-text"><?php echo $product_price; ?> <?php echo $product_psp_price; ?></p>
							<div class="row">
								<div class="col-md-6  pr-1 pb-2">
									<a href="details.php?product_id=<?php echo $product_id; ?>" class="btn btn-outline-info form-control">Details</a>
								</div>
								<div class="col-md-6  pr-3">
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

	</div>
</div>


<?php require_once 'includes/footer.php'; ?>