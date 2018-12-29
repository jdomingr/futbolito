<%@ include file="/vistas/include.jsp" %>
<!doctype html>
<!--MARCO DE INICIO. ES EN DONDE SE ARMAN TODAS LAS VISTAS-->
<html>
    <head>
        <meta charset="utf-8">
        <link rel="icon" type="image/png" sizes="32x32" href="plugins/favicon.png">
        <meta name="viewport" content="width=device-width, maximum-scale=1">
        <title>Futbolito</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/ionicons.min.css" rel="stylesheet">
        <link href="css/estiloAdmin.css" rel="stylesheet">
        
        <!--  
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link href="css/linecons.css" rel="stylesheet" type="text/css">
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
        <link href="css/responsive.css" rel="stylesheet" type="text/css">
        <link href="css/animate.css" rel="stylesheet" type="text/css">
        <link href="css/estilo.css" rel="stylesheet">
       
        <link href='http://fonts.googleapis.com/css?family=Lato:400,900,700,700italic,400italic,300italic,300,100italic,100,900italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Dosis:400,500,700,800,600,300,200' rel='stylesheet' type='text/css'>
        <link href="http://cdn.datatables.net/1.10.7/css/jquery.dataTables.css" rel="stylesheet" type="text/css">
        
        [if IE]><style type="text/css">.pie {behavior:url(PIE.htc);}</style><![endif]
            
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/jquery-scrolltofixed.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.isotope.js"></script>
        <script type="text/javascript" src="js/wow.js"></script>
        <script type="text/javascript" src="js/classie.js"></script>
        
        <script type="text/javascript" src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
            
        
        <script type="text/javascript">
         $(document).ready(function(){
            $('.data-table').DataTable( {

            "language": {
                "lengthMenu": "Mostrar _MENU_ resultados por pagina",
                "zeroRecords": "No hay coincidencias - Disculpe",
                "info": "Mostrando pagina _PAGE_ de _PAGES_",
                "infoEmpty": "No hay resultados",
                "infoFiltered": "(Se han filtrado _MAX_ resultados)",
                "search":         "Buscar:",
                "paginate": {
                    "first":      "Primero",
                    "last":       "Último",
                    "next":       "Siguiente",
                    "previous":   "Anterior"
                }
            }} );

          });
        </script>
        <script type="text/javascript">
            $(document).ready(function(e) {
                $('.res-nav_click').click(function(){
                    $('ul.toggle').slideToggle(600)	
                });	
                
                $(document).ready(function() {
                    $(window).bind('scroll', function() {
                        if ($(window).scrollTop() > 0) {
                            $('#header_outer').addClass('fixed');
                        }
                        else {
                            $('#header_outer').removeClass('fixed');
                        }
                    });
                    
                });
                
                
            });	
            function resizeText() {
                var preferredWidth = 767;
                var displayWidth = window.innerWidth;
                var percentage = displayWidth / preferredWidth;
                var fontsizetitle = 25;
                var newFontSizeTitle = Math.floor(fontsizetitle * percentage);
                $(".divclass").css("font-size", newFontSizeTitle)
            }
        </script>
        -->
    </head>
    <body>
	    <div class="color-fondo-login">
		    <div class="imagen-fondo"></div>
		</div>
        <!--Header_section-->
       <jsp:include page="headerAdministrador.jsp" /> 
            
            
        <!--content-->
        
       <jsp:include page="contentAdministrador.jsp" /> 
        <!--footer-->
        
        <jsp:include page="footer.jsp" /> 
        
        <script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>    
            
        <!-- 
        <script type="text/javascript">
            $(document).ready(function(e) {
                $('#header_outer').scrollToFixed();
                $('.res-nav_click').click(function(){
                    $('.main-nav').slideToggle();
                    return false    
                            
                });
                        
            });
        </script> 
        <script>
            wow = new WOW(
                    {
                        animateClass: 'animated',
                offset:       100
            }
                    );
            wow.init();
            document.getElementById('').onclick = function() {
                var section = document.createElement('section');
                section.className = 'wow fadeInDown';
                section.className = 'wow shake';
                section.className = 'wow zoomIn';
                section.className = 'wow lightSpeedIn';
                this.parentNode.insertBefore(section, this);
            };
        </script> 
        <script type="text/javascript">
            $(window).load(function(){
                        
                $('a').bind('click',function(event){
                    var $anchor = $(this);
                            
                    $('html, body').stop().animate({
                        scrollTop: $($anchor.attr('href')).offset().top - 91
                    }, 1500,'easeInOutExpo');
                    /*
                                if you don't want to use the easing effects:
                                $('html, body').stop().animate({
                                        scrollTop: $($anchor.attr('href')).offset().top
                                }, 1000);
                     */
                    event.preventDefault();
                });
            })
        </script> 
                    
        <script type="text/javascript">
                    
                    
            jQuery(document).ready(function($){     
                // Portfolio Isotope
                var container = $('#portfolio-wrap');	
			
                        
                container.isotope({
                    animationEngine : 'best-available',
                    animationOptions: {
                        duration: 200,
                        queue: false
                    },
                    layoutMode: 'fitRows'
                });	
                        
                $('#filters a').click(function(){
                    $('#filters a').removeClass('active');
                    $(this).addClass('active');
                    var selector = $(this).attr('data-filter');
                    container.isotope({ filter: selector });
                    setProjects();		
                    return false;
                });
                        
                        
                function splitColumns() { 
                    var winWidth = $(window).width(), 
                    columnNumb = 1;
                            
                            
                    if (winWidth > 1024) {
                        columnNumb = 4;
                    } else if (winWidth > 900) {
                        columnNumb = 2;
                    } else if (winWidth > 479) {
                        columnNumb = 2;
                    } else if (winWidth < 479) {
                        columnNumb = 1;
                    }
                            
                    return columnNumb;
                }		
                        
                function setColumns() { 
                    var winWidth = $(window).width(), 
                    columnNumb = splitColumns(), 
                    postWidth = Math.floor(winWidth / columnNumb);
                            
                    container.find('.portfolio-item').each(function () { 
                        $(this).css( { 
                            width : postWidth + 'px' 
                        });
                    });
                }		
                        
                function setProjects() { 
                    setColumns();
                    container.isotope('reLayout');
                }		
                        
                container.imagesLoaded(function () { 
                    setColumns();
                });
                        
			
                $(window).bind('resize', function () { 
                    setProjects();			
                });
                        
            });
            $( window ).load(function() {
                jQuery('#all').click();
                return false;
            });
        </script>
         -->    
    </body>
</html>