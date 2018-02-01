<%@ include file="Files/header.jsp" %> 
<!-- banner -->
<div class="inside-banner">
    <div class="container"> 
        <span class="pull-right"><a href="#">Home</a> / Contact Us</span>
        <h2>Contact Us</h2>
    </div>
</div>
<!-- banner -->


<div class="container">
    <div class="spacer">
        <div class="row contact">
            <div class="col-lg-6 col-sm-6 ">


                <input type="text" class="form-control" placeholder="Full Name">
                <input type="text" class="form-control" placeholder="Email Address">
                <input type="text" class="form-control" placeholder="Contact Number">
                <textarea rows="6" class="form-control" placeholder="Message"></textarea>
                <button type="submit" class="btn btn-success" name="Submit">Send Message</button>

            </div>
            <div class="col-lg-6 col-sm-6 ">
                <div><h4><span class="glyphicon glyphicon-map-marker"></span> Location</h4>
                    <div id="map"></div>
                    <script>
                        var geocoder;
                        var map;
                        function initMap() {
                            geocoder = new google.maps.Geocoder();
                            var latlng = new google.maps.LatLng(-34.397, 150.644);
                            var mapOptions = {
                                zoom: 15,
                                center: latlng
                            }
                            map = new google.maps.Map(document.getElementById('map'), mapOptions);

                            geocodeAddress(geocoder, map);
                        }


                        function geocodeAddress(geocoder, resultsMap) {
                            var address = document.getElementById('litAddress').innerHTML;
                            geocoder.geocode({'address': address}, function (results, status) {
                                if (status == 'OK') {
                                    resultsMap.setCenter(results[0].geometry.location);
                                    var marker = new google.maps.Marker({
                                        map: resultsMap,
                                        position: results[0].geometry.location
                                    });
                                } else {
                                    alert('Geocode was not successful for the following reason: ' + status);
                                }
                            });
                        }
                    </script>
                    <script async defer
                            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfRUgP7zWW7vO74O6qPILCQIJSdz0xGoY&callback=initMap">
                    </script>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="advertisement">
                <h4>LIT Information</h4>
                <a class="twitter-timeline"  href="https://twitter.com/hashtag/LIT" data-screen-name="LimerickIT" data-aria-polite="assertive" data-widget-id="959048100349440000">#LIT Tweets</a>
                <script>!function (d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
                        if (!d.getElementById(id)) {
                            js = d.createElement(s);
                            js.id = id;
                            js.src = p + "://platform.twitter.com/widgets.js";
                            fjs.parentNode.insertBefore(js, fjs);
                        }
                    }(document, "script", "twitter-wjs");</script>


            </div>
        </div>
    </div>
</div>

<%@ include file="Files/footer.jsp" %> 