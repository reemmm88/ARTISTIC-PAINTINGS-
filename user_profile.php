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
<?php
$customer_id = $_GET['user'];

$get_customer = $getFromU->view_customer_by_id($customer_id);

$customer_id = $get_customer->customer_id;
$customer_email = $get_customer->customer_email;
$customer_name = $get_customer->customer_name;
$customer_country = $get_customer->customer_country;
$customer_contact = $get_customer->customer_contact;
$customer_image = $get_customer->customer_image;


// $customer_id = $get_customerID_by_email($_SESSION['customer_email']);


$get_products = $getFromU->viewAllFromTable("artwork;");
$count_products = count($get_products);

$count_sell_products = $getFromU->count_product_by_status("Complete");

if (isset($_POST['overview'])) {
    $customer_disability = $_POST['disability'];
    $biography = $_POST['biography'];

    $update_customer = $getFromU->update_customer("customers", $customer_id, array("disability_id" => $customer_disability, "biography" => $biography));
    if ($update_customer) {
        echo '<script>alert("overview has been added Sucessfully")</script>';
        echo '<script>window.open("my_account.php?usr_profile", "self")</script>';
    } else {
        echo '<script>alert("overview has not added")</script>';
    }
}
if (isset($_POST['submit_challenges'])) {
    $customer_challenges = $_POST['challenges'];
    $customer_solutions = $_POST['solutions'];

    $update_customer = $getFromU->update_customer("customers", $customer_id, array("difficulties" => $customer_challenges, "overcame" => $customer_solutions));
    if ($update_customer) {
        echo '<script>alert("difficulties has been added Sucessfully")</script>';
        echo '<script>window.open("my_account.php?usr_profile", "self")</script>';
    } else {
        echo '<script>alert("difficulties has not added")</script>';
    }
}
if (isset($_POST['submit_message'])) {
    $customer_goal = $_POST['message'];

    $update_customer = $getFromU->update_customer("customers", $customer_id, array("goal" => $customer_goal));
    if ($update_customer) {
        echo '<script>alert("Your Message has been added Sucessfully")</script>';
        echo '<script>window.open("my_account.php?usr_profile", "self")</script>';
    } else {
        echo '<script>alert("Your Message has not added")</script>';
    }
}
?>

<!-- START PAGE CONTENT-->
<!-- <div class="page-heading">
    <h1 class="page-title">PROFILE</h1>
</div> -->

<div id="content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href=""><i class="fas fa-tachometer-alt"></i> User Account</a></li>
                        <li class="breadcrumb-item" aria-current="page">Profile</li>
                    </ol>
                </nav>
            </div>

            <div class="col-md-9">
                <div class="page-content fade-in-up">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="ibox rounded">
                                <div class="ibox-body text-center">
                                    <div class="mt-2"><img class="img-fluid rounded" src="customer/assets/customer_images/<?php echo $customer_image; ?>" /></div>
                                    <h5 class="font-strong m-b-10 m-t-10"><?php echo $customer_name; ?></h5>
                                    <div class="m-b-20 text-muted">Artist</div>
                                    <div class="profile-social m-b-20">
                                        <a href="javascript:;"><i class="fab fa-twitter"></i></a>
                                        <a href="javascript:;"><i class="fab fa-facebook"></i></a>
                                        <a href="javascript:;"><i class="fab fa-pinterest"></i></a>
                                        <a href="javascript:;"><i class="fab fa-dribbble"></i></a>
                                    </div>
                                    <div class="text-left">
                                        <p><i class="fas fa-envelope"></i> Email : <?php echo $customer_email; ?></p>
                                        <p><i class="fas fa-globe"></i> Country : <?php echo $customer_country; ?></p>
                                        <p><i class="fas fa-phone-square"></i> Phone No : <?php echo $customer_contact; ?></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-7">
                            <div class="ibox rounded">
                                <div class="ibox-body">
                                    <ul class="nav nav-tabs tabs-line">
                                        <li class="nav-item">
                                            <a class="nav-link active" href="#tab-1" data-toggle="tab"><i class="ti-bar-chart"></i> Overview</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#tab-2" data-toggle="tab"><i class="ti-settings"></i> Difficulties</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#tab-3" data-toggle="tab"><i class="ti-announcement"></i> Feeds</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="tab-1">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <?php
                                                    // جلب البيانات من قاعدة البيانات
                                                    $status_of_profile = $getFromU->view_customer_by_id($customer_id);
                                                    $customer_biography = $status_of_profile->biography;

                                                    // شرط إذا كانت السيرة الذاتية غير موجودة
                                                    if ($customer_biography == null):
                                                    ?>
                                                        <h5 class="text-info m-b-20 m-t-10">
                                                            <i class="fa fa-user"></i> About the Artist
                                                        </h5>

                                                        <!-- Type of Disability -->
                                                        <div class="form-group">
                                                            <label for="disability-type">Type of Disability</label>
                                                            <p>there is no any data assigned by artist</p>
                                                        </div>

                                                        <!-- Biography Section -->
                                                        <div class="form-group">
                                                            <label for="artist-biography">Biography</label>
                                                            <p>there is no any data assigned by artist</p>
                                                        </div>

                                                    <?php else: ?>
                                                        <h5 class="text-info m-b-20 m-t-10">
                                                            <i class="fa fa-user"></i> Artist Information
                                                        </h5>

                                                        <p><strong>Type of Disability:</strong>
                                                            <?php
                                                            $status_of_profile = $getFromU->view_customer_by_id($customer_id);
                                                            $customer_biography = $status_of_profile->biography;
                                                            $disability_id = $status_of_profile->disability_id;

                                                            $disability_info = $getFromU->view_disability_by_id($disability_id);
                                                            $the_disability_type = $disability_info->disability_type;
                                                            echo $the_disability_type;
                                                            ?>
                                                        </p>

                                                        <p><strong>Biography:</strong></p>
                                                        <p><?php echo nl2br(htmlspecialchars($customer_biography)); ?></p>
                                                    <?php endif; ?>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="tab-pane fade" id="tab-2">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <?php
                                                    // جلب بيانات التحديات من قاعدة البيانات
                                                    $status_of_profile = $getFromU->view_customer_by_id($customer_id);
                                                    $customer_challenges = $status_of_profile->difficulties;
                                                    $customer_solutions = $status_of_profile->overcame;

                                                    // شرط إذا لم يتم إدخال التحديات والحلول
                                                    if ($customer_challenges == null && $customer_solutions == null):
                                                    ?>
                                                        <h5 class="text-info m-b-20 m-t-10">
                                                            <i class="fa fa-exclamation-triangle"></i> Challenges
                                                        </h5>

                                                        <p class="text-muted">Share the challenges you faced as a person with disabilities and how you overcame them. This can help visitors and build a human connection.</p>

                                                        <!-- Challenges Faced -->
                                                        <div class="form-group">
                                                            <label for="artist-challenges">Challenges Faced</label>
                                                            <p>there is no any data assigned by artist</p>
                                                        </div>

                                                        <!-- How You Overcame Them -->
                                                        <div class="form-group">
                                                            <label for="artist-solutions">How You Overcame Them</label>
                                                            <p>there is no any data assigned by artist</p>
                                                        </div>
                                                    <?php else: ?>
                                                        <h5 class="text-info m-b-20 m-t-10">
                                                            <i class="fa fa-exclamation-triangle"></i> Your Challenges and Solutions
                                                        </h5>

                                                        <p><strong>Challenges Faced:</strong></p>
                                                        <p><?php echo nl2br(htmlspecialchars($customer_challenges)); ?></p>

                                                        <p><strong>How You Overcame Them:</strong></p>
                                                        <p><?php echo nl2br(htmlspecialchars($customer_solutions)); ?></p>
                                                    <?php endif; ?>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="tab-pane fade" id="tab-3">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <?php
                                                    // جلب بيانات الرسالة أو الهدف من قاعدة البيانات
                                                    $status_of_profile = $getFromU->view_customer_by_id($customer_id);
                                                    $customer_goal = $status_of_profile->goal;

                                                    // شرط إذا لم يتم إدخال الرسالة أو الهدف
                                                    if ($customer_goal == null):
                                                    ?>
                                                        <h5 class="text-info m-b-20 m-t-10">
                                                            <i class="fa fa-bullseye"></i> Artist's Message or Goal
                                                        </h5>

                                                        <p class="text-muted">Write a motivational message or express your goal in art. For example, "My dream is to showcase my art to the world."</p>
                                                        <div class="form-group">
                                                            <label for="artist-message">Your Message or Goal</label>
                                                            <p>there is no any data assigned by artist</p>
                                                        </div>
                                                    <?php else:
                                                    ?>
                                                        <h5 class="text-info m-b-20 m-t-10">
                                                            <i class="fa fa-bullseye"></i> Your Message or Goal
                                                        </h5>

                                                        <p><strong>Your Message:</strong></p>
                                                        <p><?php echo nl2br(htmlspecialchars($customer_goal)); ?></p>
                                                    <?php endif; ?>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- END PAGE CONTENT-->

            </div>

            <div id="wait" style="position: absolute;top: 40%; left: 45%; padding-top: 200px"></div>

        </div>

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
            $view_customer_product = $getFromU->view_all_Product_By_customer_id($customer_id);
            @$the_product_id = $view_customer_product->product_id;

            $products = $getFromU->view_all_Product_By_customer_id($customer_id);
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
                                <a href="user_profile.php?user=<?php echo $customer_id; ?>" class="btn btn-sm btn-info mb-0">Mnf By : <?php echo $prcustomer_name; ?></a>
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
            // } 
            ?>


        </div>
    </div>
</div>
<style>
    .profile-social a {
        font-size: 16px;
        margin: 0 10px;
        color: #999;
    }

    .profile-social a:hover {
        color: #485b6f;
    }

    .profile-stat-count {
        font-size: 22px
    }
</style>
<?php require_once 'includes/footer.php'; ?>