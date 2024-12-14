<div id="footer" class="bg-dark text-light py-5">
	<div class="container">
		<div class="row">
			<!-- Pages Section -->
			<div class="col-sm-6 col-md-3 mb-4">
				<h4 class="text-uppercase">Pages</h4>
				<ul class="list-unstyled">
					<li><a href="cart.php" class="text-light">Shopping Cart</a></li>
					<li><a href="contact.php" class="text-light">Contact Us</a></li>
					<li><a href="shop.php" class="text-light">Shop</a></li>
					<li><a href="checkout.php" class="text-light">My Account</a></li>
				</ul>
				<hr class="border-light">
				<h4 class="text-uppercase">User Section</h4>
				<ul class="list-unstyled">
					<?php if (!isset($_SESSION['customer_email'])) : ?>
						<li><a href="checkout.php" class="text-light">Login</a></li>
					<?php else : ?>
						<li><a href="logout.php" class="text-light">Logout</a></li>
					<?php endif ?>
					<li><a href="customer_register.php" class="text-light">Register</a></li>
				</ul>
			</div>

			<!-- Top Pro Categories -->
			<div class="col-sm-6 col-md-3 mb-4">
				<h4 class="text-uppercase">Top Pro Categories</h4>
				<ul class="list-unstyled">
					<?php
					$product_cats = $getFromU->viewAllFromTable("categories");
					foreach ($product_cats as $product_cat) {
						$cat_id = $product_cat->cat_id;
						$p_cat_title = $product_cat->cat_title;
					?>
						<li><a href="shop.php?cat_id=<?php echo $cat_id; ?>" class="text-light"><?php echo $p_cat_title; ?></a></li>
					<?php } ?>
				</ul>
			</div>

			<!-- Where we are -->
			<div class="col-sm-6 col-md-3 mb-4">
				<h4 class="text-uppercase">Where we Are?</h4>
				<address class="text-light">
					<strong>Prince</strong><br>
					,Sultan Street <br>
					, Medina,Saudi Arabia <br><br>
					<i class="fas fa-phone-square"></i><span class="sr-only">Telephone:</span> <a href="#" class="text-light">+966 12 345 6789</a><br>
					<i class="fas fa-envelope"></i><span class="sr-only">Mail:</span> <a href="info@artforall.com" class="text-light">info@artforall.com</a>
				</address>
				<a href="contact.php" class="text-light">Go to Contact Us Page</a>
			</div>

			<!-- Get the News and Social -->
			<div class="col-sm-6 col-md-3 mb-4">
				<h4 class="text-uppercase">Get the News</h4>
				<p class="text-muted">Stay updated with the latest news and offers.</p>
				<form method="post" action="#">
					<div class="input-group mb-2">
						<input type="email" class="form-control" id="email" placeholder="Enter your email" required>
						<div class="input-group-append">
							<button type="submit" name="submit" class="btn btn-success">Subscribe</button>
						</div>
					</div>
				</form>
				<hr class="border-light">
				<h4 class="text-uppercase">Get in Touch</h4>
				<p class="social">
					<a href="#" class="text-light mx-2"><i class="fab fa-facebook-square"></i></a>
					<a href="#" class="text-light mx-2"><i class="fab fa-twitter-square"></i></a>
					<a href="#" class="text-light mx-2"><i class="fab fa-instagram"></i></a>
					<a href="#" class="text-light mx-2"><i class="fab fa-google-plus-square"></i></a>
					<a href="#" class="text-light mx-2"><i class="fas fa-envelope"></i></a>
				</p>
			</div>
		</div>
	</div>
</div>

<!-- Copyright Section -->
<div id="copyright" class="bg-dark text-light py-3">
	<div class="container text-center">
		<p>&copy; 2024 Taibah University</p>
	</div>
</div>


<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="assets/js/metisMenu.min.js"></script>
<script src="assets/js/jquery.slimscroll.min.js"></script>
<script src="assets/js/sweetalert.min.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/data_load.js"></script>

<!-- PAGE LEVEL PLUGINS-->
<script src="assets/js/Chart.min.js" type="text/javascript"></script>
<script src="assets/js/jquery-jvectormap-2.0.3.min.js"></script>
<script src="assets/js/jquery-jvectormap-world-mill-en.js"></script>
<script src="assets/js/jquery-jvectormap-us-aea-en.js"></script>

<!-- Data Table Plugins-->
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
<script type="text/javascript" src="assets/js/dataTables.bootstrap4.min.js"></script>


</body>

</html>