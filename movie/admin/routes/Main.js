var multer=require('multer');
module.exports = function(app, passport) {
		//route for profile req


		// app.post('/signup',  passport.authenticate('local-signup', {
    //         successRedirect : '/profile',
    //         failureRedirect : '/',
    //         failureFlash : true
		// })
    // );
		//=====================================sign up===============================================================
		app.post('/signup',  multer({ dest: './public/images/'}).single('img'), passport.authenticate('local-signup', {
            successRedirect : '/msg',
            failureRedirect : '/',
          	failureFlash : true
				}));
				
		//=====================================massage===============================================================
		app.get('/msg',isLoggedIn,function(req,res,err){
			res.render('index', { title: 'Express' , msg: 'Sucessfully singuped login here' });
		});

		//=====================================sign in====================================================
		app.post('/signin', passport.authenticate('local-signin', {
            successRedirect : '/home',
            failureRedirect : '/',
            failureFlash : true
		}),
 		function(req, res) {
      //  console.log("hello");
	            if (req.body.remember)
							{
		          		req.session.cookie.maxAge = 1000 * 60 * 3;
            	}
					 		else
						 	{
									req.session.cookie.expires = false;
            	}
        		res.redirect('/');
					}
       );

//==============================================logout==========================================
	app.post('/logout', function(req, res) {
			req.logout();
			res.redirect('/');
		});

//=============================================home page=====================================
	app.get('/home', isLoggedIn ,function(req,res,next){
			res.render('home', {user: req.user});
		})

}
	function isLoggedIn(req, res, next) {
		if (req.isAuthenticated())

		return next();
		res.redirect('/');

	}

//module.exports = router;
