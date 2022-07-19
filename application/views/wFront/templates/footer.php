<footer id="fh5co-footer" role="contentinfo">
	<div class="container">

		<div class="row copyright">
			<div class="col-md-12 text-center">
				<p>
					<small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small>
					<small class="block">Designed by <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a> Demo Images: <a href="http://unsplash.co/" target="_blank">Unsplash</a></small>
				</p>
				<p>
				<ul class="fh5co-social-icons">
					<li><a href="#"><i class="icon-twitter"></i></a></li>
					<li><a href="#"><i class="icon-facebook"></i></a></li>
					<li><a href="#"><i class="icon-linkedin"></i></a></li>
					<li><a href="#"><i class="icon-dribbble"></i></a></li>
				</ul>
				</p>
			</div>
		</div>

	</div>
</footer>
</div>

<div class="gototop js-top">
	<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
</div>

<!-- jQuery -->
<script src="<?= base_url(); ?>assets/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="<?= base_url(); ?>assets/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="<?= base_url(); ?>assets/bootstrap/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="<?= base_url(); ?>assets/js/jquery.waypoints.min.js"></script>
<!-- Carousel -->
<script src="<?= base_url(); ?>assets/js/owl.carousel.min.js"></script>
<!-- countTo -->
<script src="<?= base_url(); ?>assets/js/jquery.countTo.js"></script>

<!-- Stellar -->
<script src="<?= base_url(); ?>assets/js/jquery.stellar.min.js"></script>
<!-- Magnific Popup -->
<script src="<?= base_url(); ?>assets/js/jquery.magnific-popup.min.js"></script>
<script src="<?= base_url(); ?>assets/js/magnific-popup-options.js"></script>

<!-- // <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/0.0.1/prism.min.js"></script> -->
<script src="<?= base_url(); ?>assets/js/simplyCountdown.js"></script>
<!-- Main -->
<script src="<?= base_url(); ?>assets/js/main.js"></script>

<script>
	var d = new Date(new Date().getTime() + 200 * 120 * 120 * 2000);

	// default example
	simplyCountdown('.simply-countdown-one', {
		year: d.getFullYear(),
		month: d.getMonth() + 1,
		day: d.getDate()
	});

	//jQuery example
	$('#simply-countdown-losange').simplyCountdown({
		year: d.getFullYear(),
		month: d.getMonth() + 1,
		day: d.getDate(),
		enableUtc: false
	});
</script>

</body>

</html>