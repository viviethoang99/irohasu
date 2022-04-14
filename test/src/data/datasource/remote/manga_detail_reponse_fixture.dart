import 'package:irohasu/src/domain/repositories/i_manga_repository.dart';

const mangaDetailRepository = ''' 

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />

    
    <meta property="fb:app_id" content="1092402354157500" />
    <meta property="og:type" content="article" />



    <meta property="og:url" content="https://blogtruyen.vn/21473/mairimashita-iruma-kun-21473" />
    <meta property="og:image" content="https://i7.xem-truyen.com/manga/21/21473/000b.thumb_300x300.jpg" />
    <meta property="og:title" content="Mairimashita! Iruma-kun | Blogtruyen.vn"  />
        <meta property="og:description" content="Mairimashita! Iruma-kun là câu chuyện kể về cậu bé Suzuki Iruma, người đã bị bố mẹ mình kí khế ước bán cho ác ma để đổi lấy tiền tài và bình an. Cậu bé Iruma đáng thương từ lúc mới biết đi (1 tuổi) đã phải ra xã hội lăn lộn, buôn ba khắp nơi với hai vị phụ huynh tưng tửng cho đến ngày một Ác Ma đến rước cậu đến Ma giới theo khế ước. Tưởng chừng như sắp vào bụng quỷ thì vị Ác Ma già nua này đã khóc lóc yêu cầu cậu làm cháu trai ông ta, với bản tính lương thiện và tốt bụng đến cả bản thân mình..." />
    <script type="text/javascript" nonce="56f5450bb37b4a449637a3c5281" src="//local.adguard.org?ts=1649899682774&amp;type=content-script&amp;dmn=blogtruyen.vn&amp;app=com.microsoft.edgemac&amp;css=3&amp;js=1&amp;rel=1&amp;rji=1&amp;sbe=1"></script>
<script type="text/javascript" nonce="56f5450bb37b4a449637a3c5281" src="//local.adguard.org?ts=1649899682774&amp;name=AdGuard%20Extra&amp;type=user-script"></script><link rel="canonical" href="https://blogtruyen.vn/21473/mairimashita-iruma-kun-21473" />
    <meta name="description" content="Đọc truyện Mairimashita! Iruma-kun mới nhất, sơ lược : Mairimashita! Iruma-kun là câu chuyện kể về cậu bé Suzuki Iruma, người đã bị bố mẹ mình kí khế ước bán cho ác ma để đổi lấy tiền tài và bình an. Cậu bé Iruma đáng thương từ lúc mới biết đi (1 tuổi) đã phải ra xã hội lăn lộn, buôn ba khắp nơi với hai vị phụ huynh tưng tửng cho đến ngày một Ác Ma đến rước cậu đến Ma giới theo khế ước. Tưởng chừng như sắp vào bụng quỷ thì vị Ác Ma già nua này đã khóc lóc yêu cầu cậu làm cháu trai ông ta, với bản tính lương thiện và tốt bụng đến cả bản thân mình..." />
    
    

    <meta name="google-site-verification" content="ku9D7e1Z2QXYEoCeMa2NGbak5AprHmChTwqILrTrCH8" />
    <title>Mairimashita! Iruma-kun | BlogTruyen.VN</title>
    
	<link rel="icon" type="image/png" href="/Content/themes/img/favicon.ico" />
    <link href="/Content/font-awesome.min.css" rel="stylesheet" />
    <link href="/Content/Tab.css" rel="stylesheet" />
    <link href="/Content/tipTip.css" rel="stylesheet" />
    <link href="/Content/css?v=OTem8h_f7KWcYhzb_7GIapxtIqMx9rkLbCc83flQOv41" rel="stylesheet"/>

    <link href="/Content/theme?v=KROHjGaVjXEqNoPZTwoa0uGGdxPNnSdnxfyDpcEIhNc1" rel="stylesheet"/>

    
    <link href="/Content/tinymce/mce-custom.css" rel="stylesheet" />
    <link href="/Content/jquery.fileupload.css" rel="stylesheet" />
    <link href="/Content/slider.css" rel="stylesheet" />
    <link href="/Content/switchery.min.css" rel="stylesheet" />

    <script src="/Scripts/angular.min.js"></script>
    <script src="/Scripts/common.cookie.min.js"></script>
	
	<!-- Global site tag (gtag.js) - Google Analytics -->
	
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-55294206-1');
	</script>



	
	
</head>
<body ng-app="angularApp" class="">
    <header id="toolbar">
        <div class="container">
            <div class="row">
                <div class="col-xs-2 visible-xs mobile-menu">
                    <i class="fa fa-bars iconc"></i>
                </div>
                <div class="col-md-3 hidden-sm hidden-xs">
                    <a href="/" title="Blog truyện tranh online | BlogTruyen.VN" class="logo">BLOGTRUYEN.VN</a>
                </div>
                <div class="col-md-6 col-sm-8 top-menu">

<div class="row">
        <div class="col-sm-3">
            <div class="notification" ng-controller="notificationCtrl" ng-cloak>
                <div class="row">
                    <div class="col-sm-4 col-xs-3">
                        <a href="https://id.blogtruyen.vn/tro-chuyen" target="_blank" class="fa fa-wechat text-white noti-item">
                            <span ng-if="notiMessage > 0" class="msg-item">{{ notiMessage }}</span>
                        </a>
                    </div>
                    <div class="col-sm-4 col-xs-3">
                        <a href="javascript:void(0)" data-iframeurl="https://id.blogtruyen.vn/Notify/IframeNotify" id="btnNotifyInfo" class="fa fa-info-circle text-white noti-item">
                            <span ng-if="notiInformation > 0" class="msg-item">{{ notiInformation }}</span>
                        </a>
                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <a href="javascript:void(0)" data-iframeurl="https://id.blogtruyen.vn/Notify/IframeBookmark" data-url="https://blogtruyen.vn/truyen-theo-doi" id="btnNotifyBookmark" class="fa fa-heart text-white noti-item">
                            <span ng-if="notiBookmark > 0" class="msg-item">{{ notiBookmark }}</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9">
            <ul class="menu">
                <li>
                    <a href="https://id.blogtruyen.vn">
                        <img src="https://i7.xem-truyen.com/avatar/122/122019/NeroCasterAF.thumb_64x64.png" class=" " style="vertical-align:middle;height:14px !important;" />
                        <span class="w80 text-ellipsis ds-block vertical-middle">viviethoang99</span>
                    </a>
                    <ul class="top-submenu">
                        <li><a href="/admin">Bảng điều khiển</a></li>
                        <li><a href="/admin/bao-loi-truyen-da-dang">Thống kê truyện die</a></li>
                        <li><a href="/truyen-theo-doi">Danh sách theo dõi</a></li>
                        <li></li>
                        <li><a href="/Account/Logout?returnUrl=%2F21473%2Fmairimashita-iruma-kun-21473">Thoát</a></li>
                    </ul>
                </li>
                <li><a href="/danhsach/tatca">List truyện</a></li>
                <li>
                    <a href="/Contact">Liên hệ</a>
                    <ul class="top-submenu">
                        <li><a href="/Contact">Liên hệ Quảng Cáo</a></li>
                        
                        <li><a href="/rss">Feed - RSS</a></li>
                    </ul>
                </li>
            </ul>
        </div>
</div>

                </div>
                <div class="col-md-3 col-sm-4 col-xs-10">
                    <form class="frm-q-search">
                        <input type="text" name="keyword" placeholder="Nhập tên truyện..." autocomplete="off" aria-autocomplete="none" />
                        <input type="submit" value="Tìm" />
                        <div class="result ds-none">
                            <div><img src="/Content/images/ajax-loader-1.gif" /> Đang tìm ...</div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </header>

    <div style="height: 39px;"></div>

    <section id="wrapper" class="container">

        <div id="banner">
            <a href="/">
                
            </a>
        </div>

        <nav id="menu">
<ul class="menu list-unstyled">
    <li>
        <a href="/timkiem/nangcao" title="" class="notitle"><h2>Tìm Nâng cao</h2></a>
    </li>
    <li>
        <a href="https://forum.blogtruyen.vn" title="" class="notitle"><h2>Mini Forum</h2></a>
        <ul class="submenu">
            <li><a href="https://forum.blogtruyen.vn/thu-gian-chem-gio" title="" class="notitle"><h2><h2>Thư giãn - Chém gió</h2></a></li>
            <li><a href="https://forum.blogtruyen.vn/thac-mac-gop-y-khieu-nai" title="" class="notitle"><h2><h2>Thắc mắc-Góp ý-Khiếu nại</h2></a></li>
            <li><a href="https://forum.blogtruyen.vn/fanmade" title="" class="notitle"><h2><h2>Fanmade</h2></a></li>
            <li><a href="https://forum.blogtruyen.vn/huong-dan" title="" class="notitle"><h2><h2>Hướng Dẫn</h2></a></li>
            <li><a href="https://forum.blogtruyen.vn/tuyen-nhan-su" title="" class="notitle"><h2>Tuyển nhân sự</h2></a></li>
            <li><a href="https://forum.blogtruyen.vn/" title="" class="notitle"><h2>Các mục khác</h2></a></li>
        </ul>
    </li>
    <li>
        <a href="javascript:void(0)" title="" class="notitle"><h2>Thể Loại</h2></a>
        <ul class="submenu category list-unstyled">
                <li class=""><a href="/theloai/16" title="truyện 16+" class="notitle"><h2>16+</h2></a></li>
                <li class=""><a href="/theloai/18" title="truyện 18+" class="notitle"><h2>18+</h2></a></li>
                <li class=""><a href="/theloai/action" title="truyện Action" class="notitle"><h2>Action</h2></a></li>
                <li class=""><a href="/theloai/adult" title="truyện Adult" class="notitle"><h2>Adult</h2></a></li>
                <li class=""><a href="/theloai/adventure" title="truyện Adventure" class="notitle"><h2>Adventure</h2></a></li>
                <li class=""><a href="/theloai/anime" title="truyện Anime" class="notitle"><h2>Anime</h2></a></li>
                <li class=""><a href="/theloai/bao-luc-mau-me" title="truyện Bạo lực - M&#225;u me" class="notitle"><h2>Bạo lực - M&#225;u me</h2></a></li>
                <li class=""><a href="/theloai/comedy" title="truyện Comedy" class="notitle"><h2>Comedy</h2></a></li>
                <li class=""><a href="/theloai/comic" title="truyện Comic" class="notitle"><h2>Comic</h2></a></li>
                <li class=""><a href="/theloai/doujinshi" title="truyện Doujinshi" class="notitle"><h2>Doujinshi</h2></a></li>
                <li class=""><a href="/theloai/drama-new" title="truyện Drama" class="notitle"><h2>Drama</h2></a></li>
                <li class=""><a href="/theloai/ecchi-new" title="truyện Ecchi" class="notitle"><h2>Ecchi</h2></a></li>
                <li class=""><a href="/theloai/event-bt" title="truyện Event BT" class="notitle"><h2>Event BT</h2></a></li>
                <li class=""><a href="/theloai/fantasy-new" title="truyện Fantasy" class="notitle"><h2>Fantasy</h2></a></li>
                <li class=""><a href="/theloai/full-mau" title="truyện Full m&#224;u" class="notitle"><h2>Full m&#224;u</h2></a></li>
                <li class=""><a href="/theloai/game" title="truyện Game" class="notitle"><h2>Game</h2></a></li>
                <li class=""><a href="/theloai/gender-bender-new" title="truyện Gender Bender" class="notitle"><h2>Gender Bender</h2></a></li>
                <li class=""><a href="/theloai/harem" title="truyện Harem" class="notitle"><h2>Harem</h2></a></li>
                <li class=""><a href="/theloai/historical" title="truyện Historical" class="notitle"><h2>Historical</h2></a></li>
                <li class=""><a href="/theloai/horror" title="truyện Horror" class="notitle"><h2>Horror</h2></a></li>
                <li class=""><a href="/theloai/isekai" title="truyện Isekai/Dị giới/Trọng sinh" class="notitle"><h2>Isekai/Dị giới/Trọng sinh</h2></a></li>
                <li class=""><a href="/theloai/josei" title="truyện Josei" class="notitle"><h2>Josei</h2></a></li>
                <li class=""><a href="/theloai/live-action" title="truyện Live action" class="notitle"><h2>Live action</h2></a></li>
                <li class=""><a href="/theloai/magic" title="truyện Magic" class="notitle"><h2>Magic</h2></a></li>
                <li class=""><a href="/theloai/manga" title="truyện manga" class="notitle"><h2>manga</h2></a></li>
                <li class=""><a href="/theloai/manhua" title="truyện Manhua" class="notitle"><h2>Manhua</h2></a></li>
                <li class=""><a href="/theloai/manhwa" title="truyện Manhwa" class="notitle"><h2>Manhwa</h2></a></li>
                <li class=""><a href="/theloai/martial-arts" title="truyện Martial Arts" class="notitle"><h2>Martial Arts</h2></a></li>
                <li class=""><a href="/theloai/mature" title="truyện Mature" class="notitle"><h2>Mature</h2></a></li>
                <li class=""><a href="/theloai/mecha" title="truyện Mecha" class="notitle"><h2>Mecha</h2></a></li>
                <li class=""><a href="/theloai/mystery" title="truyện Mystery" class="notitle"><h2>Mystery</h2></a></li>
                <li class=""><a href="/theloai/nau-an" title="truyện Nấu Ăn" class="notitle"><h2>Nấu Ăn</h2></a></li>
                <li class=""><a href="/theloai/ngon-tinh" title="truyện Ng&#244;n T&#236;nh" class="notitle"><h2>Ng&#244;n T&#236;nh</h2></a></li>
                <li class=""><a href="/theloai/ntr" title="truyện NTR" class="notitle"><h2>NTR</h2></a></li>
                <li class=""><a href="/theloai/one-shot" title="truyện One shot" class="notitle"><h2>One shot</h2></a></li>
                <li class=""><a href="/theloai/psychological" title="truyện Psychological" class="notitle"><h2>Psychological</h2></a></li>
                <li class=""><a href="/theloai/romance" title="truyện Romance" class="notitle"><h2>Romance</h2></a></li>
                <li class=""><a href="/theloai/school-life" title="truyện School Life" class="notitle"><h2>School Life</h2></a></li>
                <li class=""><a href="/theloai/sci-fi" title="truyện Sci-fi" class="notitle"><h2>Sci-fi</h2></a></li>
                <li class=""><a href="/theloai/seinen" title="truyện Seinen" class="notitle"><h2>Seinen</h2></a></li>
                <li class=""><a href="/theloai/shoujo" title="truyện Shoujo" class="notitle"><h2>Shoujo</h2></a></li>
                <li class=""><a href="/theloai/shoujo-ai" title="truyện Shoujo Ai" class="notitle"><h2>Shoujo Ai</h2></a></li>
                <li class=""><a href="/theloai/shounen" title="truyện Shounen" class="notitle"><h2>Shounen</h2></a></li>
                <li class=""><a href="/theloai/shounen-ai" title="truyện Shounen Ai" class="notitle"><h2>Shounen Ai</h2></a></li>
                <li class=""><a href="/theloai/slice-of-life" title="truyện Slice of life" class="notitle"><h2>Slice of life</h2></a></li>
                <li class=""><a href="/theloai/smut" title="truyện Smut" class="notitle"><h2>Smut</h2></a></li>
                <li class=""><a href="/theloai/soft-yaoi" title="truyện Soft Yaoi" class="notitle"><h2>Soft Yaoi</h2></a></li>
                <li class=""><a href="/theloai/soft-yuri" title="truyện Soft Yuri" class="notitle"><h2>Soft Yuri</h2></a></li>
                <li class=""><a href="/theloai/sports" title="truyện Sports" class="notitle"><h2>Sports</h2></a></li>
                <li class=""><a href="/theloai/supernatural" title="truyện Supernatural" class="notitle"><h2>Supernatural</h2></a></li>
                <li class=""><a href="/theloai/tap-chi-truyen-tranh" title="truyện Tạp ch&#237; truyện tranh" class="notitle"><h2>Tạp ch&#237; truyện tranh</h2></a></li>
                <li class=""><a href="/theloai/tragedy" title="truyện Tragedy" class="notitle"><h2>Tragedy</h2></a></li>
                <li class=""><a href="/theloai/trap-crossdressing" title="truyện Trap (Crossdressing)" class="notitle"><h2>Trap (Crossdressing)</h2></a></li>
                <li class=""><a href="/theloai/trinh-tham" title="truyện Trinh Th&#225;m" class="notitle"><h2>Trinh Th&#225;m</h2></a></li>
                <li class=""><a href="/theloai/truyen-scan" title="truyện Truyện scan" class="notitle"><h2>Truyện scan</h2></a></li>
                <li class=""><a href="/theloai/tu-chan-tu-tien" title="truyện Tu ch&#226;n - tu ti&#234;n" class="notitle"><h2>Tu ch&#226;n - tu ti&#234;n</h2></a></li>
                <li class=""><a href="/theloai/video-clip" title="truyện Video Clip" class="notitle"><h2>Video Clip</h2></a></li>
                <li class=""><a href="/theloai/vncomic" title="truyện VnComic" class="notitle"><h2>VnComic</h2></a></li>
                <li class=""><a href="/theloai/webtoon" title="truyện Webtoon" class="notitle"><h2>Webtoon</h2></a></li>
                <li class=""><a href="/theloai/yuri" title="truyện Yuri" class="notitle"><h2>Yuri</h2></a></li>
            <li><a href="/theloai/truyen-full" title="truyện full" class="notitle"><h2>Truyện full</h2></a></li>
        </ul>
    </li>
    <li>
        <a href="/theloai/truyen-full" title="" class="notitle"><h2>Đủ Bộ</h2></a>
    </li>
    <li>
        <a href="/theloai/shoujo" title="" class="notitle"><h2>Con Gái</h2></a>
    </li>
    <li>
        <a href="/theloai/shounen" title="" class="notitle"><h2>Con Trai</h2></a>
    </li>
    <li>
        <a href="https://forum.blogtruyen.vn/huong-dan" title="" class="notitle"><h2>Hướng Dẫn</h2></a>
        <ul class="submenu" style="margin-left: 572px;width: 213px;">
            <li><a href="/diendan/huong-dan/upload-truyen-5" class="notitle"><h2>Hướng Dẫn đăng Truyện</h2></a></li>
            <li><a href="/diendan/huong-dan/admin-huong-dan-edit-truyen-cho-nguoi-moi-18435" title="" class="notitle"><h2>Hướng Dẫn Edit Truyện</h2></a></li>
            <li><a href="/diendan/huong-dan/huong-dan-chen-video-youtube-vao-bai-trong-miniforum-99" title="" class="notitle"><h2>Chèn Video Youtube</h2></a></li>
            <li><a href="/diendan/huong-dan/huong-dan-lam-nut-xem-an-spoiler-876" title="" class="notitle"><h2>Cách dùng nút Xem/Ẩn</h2></a></li>
        </ul>
    </li>
    <li>
        <a target="_blank" href="https://afkmobi.com/vi/gameh5" title="" class="notitle"><h2>Mini Game</h2></a>
    </li>

</ul>
            <div class="nav-headermenu visible-xs">
                <i class="fa fa-bars iconc"></i>
            </div>
        </nav>

        <div class="qc-inner">

        </div>

        <div id="mota">
            <h1>Truyện Tranh Online, đọc truyện tranh</h1>
            <p class="description">
                <span>Truyen tranh online, truyện tranh online,truyện tranh truyentranh, manga, đọc truyện online, truyenonline</span>
            </p>
        </div>

        <!--// Widget bên dưới menu ngang \\-->
        <section id="TopAds"></section>
        <!--\\ Widget bên dưới menu ngang //-->

        <div id="breadcrumbs">
            <span class="icon-home"></span>
            
    <span>
        <a itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb" itemprop="url" title="Truyện tranh online, đọc truyện tranh" href="/"><span itemprop="title">Trang chủ</span></a> &gt; Mairimashita! Iruma-kun
    </span>

        </div>


        <section class="main-content">
            <div class="row">
                    <div class="col-md-8">
                        








<!--Facebook Init 1557084554545676 -->

<div id="fb-root"></div>
<script>
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.1&appId=1092402354157500";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

<!--Facebook Init-->

<section class="manga-detail 2 bigclass" ng-controller="MangaDetailCtrl">

    <input id="MangaId" name="MangaId" type="hidden" value="21473" />
    <input id="ChapterId" name="ChapterId" type="hidden" value="0" />
    <input id="CommentIndex" name="CommentIndex" type="hidden" value="1" />

    <h1 class="entry-title">
        <a href="/21473/mairimashita-iruma-kun-21473" title="truyện tranh Mairimashita! Iruma-kun">Mairimashita! Iruma-kun Update Chương 247: Lằn ranh thắng bại</a>
    </h1>

    <div class="thumbnail">
        <img src="https://i7.xem-truyen.com/manga/21/21473/000b.thumb_500x.jpg" alt="truyện tranh Mairimashita! Iruma-kun" title="truyện tranh Mairimashita! Iruma-kun" />
    </div>

    <div class="detail">
        <div class="title">SƠ LƯỢC</div>
        <div class="content">
            <strong><em>Mairimashita! Iruma-kun</em></strong> là câu chuyện kể về cậu bé <strong><em>Suzuki Iruma</em></strong>, người đã bị bố mẹ mình kí khế ước bán cho ác ma để đổi lấy tiền tài và bình an. Cậu bé Iruma đáng thương từ lúc mới biết đi (1 tuổi) đã phải "ra xã hội" lăn lộn, buôn ba khắp nơi với hai vị phụ huynh "tưng tửng" cho đến ngày một Ác Ma đến rước cậu đến Ma giới theo khế ước. Tưởng chừng như sắp vào bụng quỷ thì vị Ác Ma già nua này đã khóc lóc yêu cầu cậu làm cháu trai ông ta, với bản tính lương thiện và tốt bụng đến cả bản thân mình cũng phải kinh ngạc, cậu bất đắc dĩ đã đồng ý lời đề nghị đó và nhập học trường Ác Ma theo ý ông ta. Chuyện gì sẽ xảy ra tiếp theo, mời các bạn theo dõi cuộc sống học đường đầy bất thường của Iruma-kun.
        </div>
    </div>

    <div class="description">
            <p>Tên khác: <span class="color-red">魔入りました！入間くん</span></p>
                    <p>
                Tác giả:
                    <a href="/tac-gia/nishi-osamu-7015" target="_blank" class="color-green label label-info">Nishi Osamu</a>
            </p>

            <p>
                Nguồn:
                    <a href="#" target="_blank" class="color-blue label label-warning">Wicked House Translation</a>
                    <a href="#" target="_blank" class="color-blue label label-warning">hocvientruyentranh.net</a>
            </p>

            <p>
                Nhóm dịch:
                    <span class="translater"><a href="/nhom-dich/wicked-house-437" title="nhóm dịch Wicked House">Wicked House</a></span>
                    <span class="translater"><a href="/nhom-dich/bullet-burn-team-559" title="nhóm dịch Bullet Burn Team">Bullet Burn Team</a></span>
            </p>

            <p>
                Thể loại:
                    <span class="category"><a href="/theloai/action" title="truyện Action">Action</a></span>
                    <span class="category"><a href="/theloai/school-life" title="truyện School Life">School Life</a></span>
                    <span class="category"><a href="/theloai/supernatural" title="truyện Supernatural">Supernatural</a></span>
                    <span class="category"><a href="/theloai/magic" title="truyện Magic">Magic</a></span>
                    <span class="category"><a href="/theloai/manga" title="truyện manga">manga</a></span>
            </p>

        <p>
            Đăng bởi:
            <a href="https://id.blogtruyen.vn/thanh-vien/100026" target="_blank" class="color-u-1" title="Xem trang cá nhân của leduyvu">leduyvu</a>

            Trạng thái:
            <span class="color-red">Đang tiến h&#224;nh</span>
        </p>


        <p>
            Số lượt xem:
            <span class="color-fuchsia mr10" id="PageViews">4671221</span>

            Theo dõi:
            <span class="color-hotpink" id="LikeCount">3148</span>
        </p>
        <p class="published-date">
            <div class="row">
                <div class="col-sm-6">
                    Update:
                    <span class="color-green">10/04/2022 13:39</span>
                </div>
                <div class="col-sm-6 text-right">
                    <ul class="like-buttons">
                                <li id="btnBookmart" class="item">
                                    <span class="showBookmart" data-auth="1"><i class="fa fa-bookmark"></i> Thêm vào bookmark</span>
                                    <div class="bookmart-area">
                                        


<div class="overlay-content-property">
    <img src="/Content/images/loading.gif" class="img-load" alt="loading..." />
    <p>Đang tải...</p>
</div>
                                    </div>                                    
                                </li>
                    </ul>
                </div>

            </div>
        </p>
            <p>
                <ul class="list-unstyled like-buttons">
                    
                    

                </ul>

            </p>

    </div>

    <hr />
	<!---Tc-list -->

	
    <hr />

        <div class="list-chapters">
            <p>
                <span>TỔNG HỢP (269 CHƯƠNG)</span>
                <a href="javascript:void(0)" class="arrow-orderby icon-circle-arrows-top fl-r"></a>
            </p>
            <div id="loadChapter">
<p>
    <span class="title al-c">Tên chương</span>
    <span class="publishedDate al-c">Ngày đăng</span>
    <span class="download"></span>
</p>
<div class="list-wrap" id="list-chapters">
        <p id="chapter-685181">
            <span class="title">
                <a id="c_685181" href="/c685181/mairimashita-iruma-kun-21473-chuong-247-lan-ranh-thang-bai" title="Mairimashita! Iruma-kun Chương 247: Lằn ranh thắng bại" >Mairimashita! Iruma-kun Chương 247: Lằn ranh thắng bại</a>
            </span>
            <span class="publishedDate">10/04/2022 13:39</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-682258">
            <span class="title">
                <a id="c_682258" href="/c682258/mairimashita-iruma-kun-21473-chuong-246-tro-thu-ac-ma" title="Mairimashita! Iruma-kun Chương 246: Trợ thủ &#225;c ma" >Mairimashita! Iruma-kun Chương 246: Trợ thủ &#225;c ma</a>
            </span>
            <span class="publishedDate">02/04/2022 00:46</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-680313">
            <span class="title">
                <a id="c_680313" href="/c680313/mairimashita-iruma-kun-21473-chuong-245-nhung-ac-ma-het-len-tinh-yeu" title="Mairimashita! Iruma-kun Chương 245: Những &#225;c ma h&#233;t l&#234;n t&#236;nh y&#234;u" >Mairimashita! Iruma-kun Chương 245: Những &#225;c ma h&#233;t l&#234;n t&#236;nh y&#234;u</a>
            </span>
            <span class="publishedDate">25/03/2022 00:21</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-679243">
            <span class="title">
                <a id="c_679243" href="/c679243/mairimashita-iruma-kun-21473-chuong-244-thich" title="Mairimashita! Iruma-kun Chương 244: Th&#237;ch" >Mairimashita! Iruma-kun Chương 244: Th&#237;ch</a>
            </span>
            <span class="publishedDate">20/03/2022 23:29</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-676937">
            <span class="title">
                <a id="c_676937" href="/c676937/mairimashita-iruma-kun-21473-chuong-243-ac-ma-mang-ten-caim-kamui" title="Mairimashita! Iruma-kun Chương 243: &#193;c ma mang t&#234;n Caim Kamui " >Mairimashita! Iruma-kun Chương 243: &#193;c ma mang t&#234;n Caim Kamui </a>
            </span>
            <span class="publishedDate">13/03/2022 18:14</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-675141">
            <span class="title">
                <a id="c_675141" href="/c675141/mairimashita-iruma-kun-21473-chuong-242-quyet-dinh-cua-dua-tre-ca-biet" title="Mairimashita! Iruma-kun Chương 242: Quyết định của đứa trẻ c&#225; biệt" >Mairimashita! Iruma-kun Chương 242: Quyết định của đứa trẻ c&#225; biệt</a>
            </span>
            <span class="publishedDate">06/03/2022 18:05</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-672978">
            <span class="title">
                <a id="c_672978" href="/c672978/mairimashita-iruma-kun-21473-chuong-241-xanh-va-tim" title="Mairimashita! Iruma-kun Chương 241: Xanh v&#224; T&#237;m" >Mairimashita! Iruma-kun Chương 241: Xanh v&#224; T&#237;m</a>
            </span>
            <span class="publishedDate">27/02/2022 00:29</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-670172">
            <span class="title">
                <a id="c_670172" href="/c670172/mairimashita-iruma-kun-21473-chuong-240-doa-hoa-ngoi-ca-cuoc-doi" title="Mairimashita! Iruma-kun Chương 240: Đo&#225; hoa ngợi ca cuộc đời" >Mairimashita! Iruma-kun Chương 240: Đo&#225; hoa ngợi ca cuộc đời</a>
            </span>
            <span class="publishedDate">18/02/2022 11:20</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-668779">
            <span class="title">
                <a id="c_668779" href="/c668779/mairimashita-iruma-kun-21473-chuong-239-giao-duong-va-giao-duc" title="Mairimashita! Iruma-kun Chương 239: Gi&#225;o dưỡng v&#224; gi&#225;o dục" >Mairimashita! Iruma-kun Chương 239: Gi&#225;o dưỡng v&#224; gi&#225;o dục</a>
            </span>
            <span class="publishedDate">12/02/2022 17:53</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-667323">
            <span class="title">
                <a id="c_667323" href="/c667323/mairimashita-iruma-kun-21473-chuong-238-ky-thuat-so-truong-cua-toi" title="Mairimashita! Iruma-kun Chương 238: Kỹ thuật sở trường của t&#244;i" >Mairimashita! Iruma-kun Chương 238: Kỹ thuật sở trường của t&#244;i</a>
            </span>
            <span class="publishedDate">06/02/2022 07:28</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-664737">
            <span class="title">
                <a id="c_664737" href="/c664737/mairimashita-iruma-kun-21473-chuong-237-phan-chia-doi-hinh-ly-tuong" title="Mairimashita! Iruma-kun Chương 237: Ph&#226;n chia đội h&#236;nh l&#253; tưởng" >Mairimashita! Iruma-kun Chương 237: Ph&#226;n chia đội h&#236;nh l&#253; tưởng</a>
            </span>
            <span class="publishedDate">29/01/2022 21:06</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-663101">
            <span class="title">
                <a id="c_663101" href="/c663101/mairimashita-iruma-kun-21473-chuong-236-sos" title="Mairimashita! Iruma-kun Chương 236: SOS" >Mairimashita! Iruma-kun Chương 236: SOS</a>
            </span>
            <span class="publishedDate">23/01/2022 11:06</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-660225">
            <span class="title">
                <a id="c_660225" href="/c660225/mairimashita-iruma-kun-21473-chuong-235-bi-loai" title="Mairimashita! Iruma-kun Chương 235: Bị loại" >Mairimashita! Iruma-kun Chương 235: Bị loại</a>
            </span>
            <span class="publishedDate">15/01/2022 07:51</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-658028">
            <span class="title">
                <a id="c_658028" href="/c658028/mairimashita-iruma-kun-21473-chuong-234-mot-phan-cua-the-gioi" title="Mairimashita! Iruma-kun Chương 234: Một phần của thế giới" >Mairimashita! Iruma-kun Chương 234: Một phần của thế giới</a>
            </span>
            <span class="publishedDate">09/01/2022 05:53</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-503356">
            <span class="title">
                <a id="c_503356" href="/c503356/mairimashita-iruma-kun-21473-omake-volume-14" title="Mairimashita! Iruma-kun Omake Volume 14" >Mairimashita! Iruma-kun Omake Volume 14</a>
            </span>
            <span class="publishedDate">29/09/2020 22:54</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-503355">
            <span class="title">
                <a id="c_503355" href="/c503355/mairimashita-iruma-kun-21473-omake-volume-13" title="Mairimashita! Iruma-kun Omake Volume 13" >Mairimashita! Iruma-kun Omake Volume 13</a>
            </span>
            <span class="publishedDate">29/09/2020 22:54</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-503234">
            <span class="title">
                <a id="c_503234" href="/c503234/mairimashita-iruma-kun-21473-omake-volume-12" title="Mairimashita! Iruma-kun Omake Volume 12" >Mairimashita! Iruma-kun Omake Volume 12</a>
            </span>
            <span class="publishedDate">29/09/2020 00:08</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-503233">
            <span class="title">
                <a id="c_503233" href="/c503233/mairimashita-iruma-kun-21473-omake-volume-11" title="Mairimashita! Iruma-kun Omake Volume 11" >Mairimashita! Iruma-kun Omake Volume 11</a>
            </span>
            <span class="publishedDate">29/09/2020 00:08</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-653724">
            <span class="title">
                <a id="c_653724" href="/c653724/mairimashita-iruma-kun-21473-chuong-233-tro-choi-tron-tim" title="Mairimashita! Iruma-kun Chương 233: Tr&#242; chơi trốn t&#236;m" >Mairimashita! Iruma-kun Chương 233: Tr&#242; chơi trốn t&#236;m</a>
            </span>
            <span class="publishedDate">26/12/2021 18:18</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-648650">
            <span class="title">
                <a id="c_648650" href="/c648650/mairimashita-iruma-kun-21473-chuong-232-mong-duoc-giup-do-nhe" title="Mairimashita! Iruma-kun Chương 232: Mong được gi&#250;p đỡ nh&#233;" >Mairimashita! Iruma-kun Chương 232: Mong được gi&#250;p đỡ nh&#233;</a>
            </span>
            <span class="publishedDate">10/12/2021 21:08</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-646474">
            <span class="title">
                <a id="c_646474" href="/c646474/mairimashita-iruma-kun-21473-chuong-231-tran-chien-gianh-vi-tri" title="Mairimashita! Iruma-kun Chương 231: Trận chiến gi&#224;nh vị tr&#237;" >Mairimashita! Iruma-kun Chương 231: Trận chiến gi&#224;nh vị tr&#237;</a>
            </span>
            <span class="publishedDate">04/12/2021 21:40</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-644240">
            <span class="title">
                <a id="c_644240" href="/c644240/mairimashita-iruma-kun-21473-chuong-230-van-con-non-not" title="Mairimashita! Iruma-kun Chương 230: Vẫn c&#242;n non nớt" >Mairimashita! Iruma-kun Chương 230: Vẫn c&#242;n non nớt</a>
            </span>
            <span class="publishedDate">27/11/2021 16:48</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-641916">
            <span class="title">
                <a id="c_641916" href="/c641916/mairimashita-iruma-kun-21473-chuong-229-neu-nhu-bi-ha-guc-se-khong-xay-ra-cai-va" title="Mairimashita! Iruma-kun Chương 229: Nếu như bị hạ gục sẽ kh&#244;ng xảy ra c&#227;i v&#227;" >Mairimashita! Iruma-kun Chương 229: Nếu như bị hạ gục sẽ kh&#244;ng xảy ra c&#227;i v&#227;</a>
            </span>
            <span class="publishedDate">20/11/2021 20:16</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-638556">
            <span class="title">
                <a id="c_638556" href="/c638556/mairimashita-iruma-kun-21473-chuong-228-nang-luc-cua-toi-la" title="Mairimashita! Iruma-kun Chương 228: Năng lực của t&#244;i l&#224;..." >Mairimashita! Iruma-kun Chương 228: Năng lực của t&#244;i l&#224;...</a>
            </span>
            <span class="publishedDate">13/11/2021 13:37</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-635942">
            <span class="title">
                <a id="c_635942" href="/c635942/mairimashita-iruma-kun-21473-chuong-227-doi-valac" title="Mairimashita! Iruma-kun Chương 227: Đội Valac" >Mairimashita! Iruma-kun Chương 227: Đội Valac</a>
            </span>
            <span class="publishedDate">06/11/2021 07:41</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-633723">
            <span class="title">
                <a id="c_633723" href="/c633723/mairimashita-iruma-kun-21473-chuong-226-neu-la-vi-nhung-hoc-tro-dang-yeu" title="Mairimashita! Iruma-kun Chương 226: Nếu l&#224; v&#236; những học tr&#242; đ&#225;ng y&#234;u" >Mairimashita! Iruma-kun Chương 226: Nếu l&#224; v&#236; những học tr&#242; đ&#225;ng y&#234;u</a>
            </span>
            <span class="publishedDate">30/10/2021 17:09</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-631709">
            <span class="title">
                <a id="c_631709" href="/c631709/mairimashita-iruma-kun-21473-chuong-225-am-thanh-khai-mac-ngan-vang" title="Mairimashita! Iruma-kun Chương 225: &#194;m thanh khai mạc ng&#226;n vang" >Mairimashita! Iruma-kun Chương 225: &#194;m thanh khai mạc ng&#226;n vang</a>
            </span>
            <span class="publishedDate">22/10/2021 22:11</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-629200">
            <span class="title">
                <a id="c_629200" href="/c629200/mairimashita-iruma-kun-21473-chuong-224-nhung-ac-ma-hung-khoi" title="Mairimashita! Iruma-kun Chương 224: Những &#225;c ma hứng khởi " >Mairimashita! Iruma-kun Chương 224: Những &#225;c ma hứng khởi </a>
            </span>
            <span class="publishedDate">15/10/2021 15:02</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-626151">
            <span class="title">
                <a id="c_626151" href="/c626151/mairimashita-iruma-kun-21473-chuong-223-nhung-ac-ma-tre-tuoi-tu-hop" title="Mairimashita! Iruma-kun Chương 223: Những &#225;c ma trẻ tuổi tụ hợp" >Mairimashita! Iruma-kun Chương 223: Những &#225;c ma trẻ tuổi tụ hợp</a>
            </span>
            <span class="publishedDate">08/10/2021 11:41</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-624947">
            <span class="title">
                <a id="c_624947" href="/c624947/mairimashita-iruma-kun-21473-chuong-222-ket-qua-cuoc-tro-chuyen" title="Mairimashita! Iruma-kun Chương 222: Kết quả cuộc tr&#242; chuyện" >Mairimashita! Iruma-kun Chương 222: Kết quả cuộc tr&#242; chuyện</a>
            </span>
            <span class="publishedDate">01/10/2021 07:54</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-622276">
            <span class="title">
                <a id="c_622276" href="/c622276/mairimashita-iruma-kun-21473-chuong-221-lan-dau-gap-mat" title="Mairimashita! Iruma-kun Chương 221: Lần đầu gặp mặt" >Mairimashita! Iruma-kun Chương 221: Lần đầu gặp mặt</a>
            </span>
            <span class="publishedDate">22/09/2021 22:18</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-620829">
            <span class="title">
                <a id="c_620829" href="/c620829/mairimashita-iruma-kun-21473-chuong-220-quan-co-moi" title="Mairimashita! Iruma-kun Chương 220: Qu&#226;n cờ mới" >Mairimashita! Iruma-kun Chương 220: Qu&#226;n cờ mới</a>
            </span>
            <span class="publishedDate">18/09/2021 07:17</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-617697">
            <span class="title">
                <a id="c_617697" href="/c617697/mairimashita-iruma-kun-21473-chuong-219-13-gio-cua-naberius-kalego-phan-sau" title="Mairimashita! Iruma-kun Chương 219: 13 Giờ của Naberius Kalego - Phần Sau" >Mairimashita! Iruma-kun Chương 219: 13 Giờ của Naberius Kalego - Phần Sau</a>
            </span>
            <span class="publishedDate">10/09/2021 15:43</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-616068">
            <span class="title">
                <a id="c_616068" href="/c616068/mairimashita-iruma-kun-21473-chuong-218-13-gio-cua-kalego-phan-giua" title="Mairimashita! Iruma-kun Chương 218: 13 Giờ của Naberius Kalego - Phần Giữa" >Mairimashita! Iruma-kun Chương 218: 13 Giờ của Naberius Kalego - Phần Giữa</a>
            </span>
            <span class="publishedDate">04/09/2021 08:27</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-613259">
            <span class="title">
                <a id="c_613259" href="/c613259/mairimashita-iruma-kun-21473-chuong-217-13-gio-cua-kalego-phan-dau" title="Mairimashita! Iruma-kun Chương 217: 13 Giờ của Naberius Kalego - Phần Đầu" >Mairimashita! Iruma-kun Chương 217: 13 Giờ của Naberius Kalego - Phần Đầu</a>
            </span>
            <span class="publishedDate">27/08/2021 19:57</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-609790">
            <span class="title">
                <a id="c_609790" href="/c609790/mairimashita-iruma-kun-21473-chuong-216-ly-do-quan-trong-nhat" title="Mairimashita! Iruma-kun Chương 216: L&#253; do quan trọng nhất" >Mairimashita! Iruma-kun Chương 216: L&#253; do quan trọng nhất</a>
            </span>
            <span class="publishedDate">21/08/2021 08:00</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-603102">
            <span class="title">
                <a id="c_603102" href="/c603102/mairimashita-iruma-kun-21473-chuong-215-mot-nam-hoc-moi" title="Mairimashita! Iruma-kun Chương 215: Một năm học mới" >Mairimashita! Iruma-kun Chương 215: Một năm học mới</a>
            </span>
            <span class="publishedDate">06/08/2021 22:19</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-600253">
            <span class="title">
                <a id="c_600253" href="/c600253/mairimashita-iruma-kun-21473-chuong-214-hoan-nghenh-den-truong-babyls" title="Mairimashita! Iruma-kun Chương 214: Hoan ngh&#234;nh đến trường Babyls" >Mairimashita! Iruma-kun Chương 214: Hoan ngh&#234;nh đến trường Babyls</a>
            </span>
            <span class="publishedDate">30/07/2021 21:28</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-597936">
            <span class="title">
                <a id="c_597936" href="/c597936/mairimashita-iruma-kun-21473-chuong-213-bua-tiec-chia-tay-day-hoanh-trang" title="Mairimashita! Iruma-kun Chương 213: Bữa tiệc chia tay đầy ho&#224;nh tr&#225;ng" >Mairimashita! Iruma-kun Chương 213: Bữa tiệc chia tay đầy ho&#224;nh tr&#225;ng</a>
            </span>
            <span class="publishedDate">23/07/2021 18:48</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-594591">
            <span class="title">
                <a id="c_594591" href="/c594591/mairimashita-iruma-kun-21473-chuong-212-mon-qua-tu-su-phu" title="Mairimashita! Iruma-kun Chương 212: M&#243;n qu&#224; từ sư phụ" >Mairimashita! Iruma-kun Chương 212: M&#243;n qu&#224; từ sư phụ</a>
            </span>
            <span class="publishedDate">16/07/2021 02:57</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-592475">
            <span class="title">
                <a id="c_592475" href="/c592475/mairimashita-iruma-kun-21473-chuong-211-du-co-choi-than-di-nua" title="Mairimashita! Iruma-kun Chương 211: D&#249; c&#243; chơi th&#226;n đi nữa" >Mairimashita! Iruma-kun Chương 211: D&#249; c&#243; chơi th&#226;n đi nữa</a>
            </span>
            <span class="publishedDate">09/07/2021 07:23</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-590544">
            <span class="title">
                <a id="c_590544" href="/c590544/mairimashita-iruma-kun-21473-chuong-210-chu-nao-to-nay-la-le-tu-nhien-o-ma-gioi" title="Mairimashita! Iruma-kun Chương 210: Chủ n&#224;o tớ nấy l&#224; lẽ tự nhi&#234;n ở Ma Giới" >Mairimashita! Iruma-kun Chương 210: Chủ n&#224;o tớ nấy l&#224; lẽ tự nhi&#234;n ở Ma Giới</a>
            </span>
            <span class="publishedDate">03/07/2021 19:14</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-588951">
            <span class="title">
                <a id="c_588951" href="/c588951/mairimashita-iruma-kun-21473-chuong-209-thanh-vien-moi" title="Mairimashita! Iruma-kun Chương 209: Th&#224;nh vi&#234;n mới" >Mairimashita! Iruma-kun Chương 209: Th&#224;nh vi&#234;n mới</a>
            </span>
            <span class="publishedDate">26/06/2021 01:21</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-586756">
            <span class="title">
                <a id="c_586756" href="/c586756/mairimashita-iruma-kun-21473-chuong-208-xam-nhap-ky-tuc-xa-giao-vien" title="Mairimashita! Iruma-kun Chương 208: X&#226;m nhập k&#253; t&#250;c x&#225; gi&#225;o vi&#234;n" >Mairimashita! Iruma-kun Chương 208: X&#226;m nhập k&#253; t&#250;c x&#225; gi&#225;o vi&#234;n</a>
            </span>
            <span class="publishedDate">19/06/2021 01:53</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-584122">
            <span class="title">
                <a id="c_584122" href="/c584122/mairimashita-iruma-kun-21473-chuong-207-con-duong-tien-den-ngoi-vi-ma-vuong" title="Mairimashita! Iruma-kun Chương 207: Con đường tiến đến ng&#244;i vị Ma Vương" >Mairimashita! Iruma-kun Chương 207: Con đường tiến đến ng&#244;i vị Ma Vương</a>
            </span>
            <span class="publishedDate">11/06/2021 12:21</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-581986">
            <span class="title">
                <a id="c_581986" href="/c581986/mairimashita-iruma-kun-21473-chuong-206-nhung-chu-su-tu-vang" title="Mairimashita! Iruma-kun Chương 206: Những ch&#250; sư tử v&#224;ng" >Mairimashita! Iruma-kun Chương 206: Những ch&#250; sư tử v&#224;ng</a>
            </span>
            <span class="publishedDate">03/06/2021 18:43</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-580572">
            <span class="title">
                <a id="c_580572" href="/c580572/mairimashita-iruma-kun-21473-chuong-205-dam-luan-ve-ma-vuong" title="Mairimashita! Iruma-kun Chương 205: Đ&#224;m luận về Ma Vương" >Mairimashita! Iruma-kun Chương 205: Đ&#224;m luận về Ma Vương</a>
            </span>
            <span class="publishedDate">28/05/2021 18:30</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-579280">
            <span class="title">
                <a id="c_579280" href="/c579280/mairimashita-iruma-kun-21473-chuong-204-nhung-tia-nang-xuyen-qua-ke-la" title="Mairimashita! Iruma-kun Chương 204: Những tia nắng xuy&#234;n qua kẽ l&#225;" >Mairimashita! Iruma-kun Chương 204: Những tia nắng xuy&#234;n qua kẽ l&#225;</a>
            </span>
            <span class="publishedDate">24/05/2021 22:08</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-576693">
            <span class="title">
                <a id="c_576693" href="/c576693/mairimashita-iruma-kun-21473-chuong-203-nguon-dinh-duong-doi-dao-cho-nhung-chiec-la-non" title="Mairimashita! Iruma-kun Chương 203: Nguồn dinh dưỡng dồi d&#224;o cho những chiếc l&#225; non" >Mairimashita! Iruma-kun Chương 203: Nguồn dinh dưỡng dồi d&#224;o cho những chiếc l&#225; non</a>
            </span>
            <span class="publishedDate">14/05/2021 01:54</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-575648">
            <span class="title">
                <a id="c_575648" href="/c575648/mairimashita-iruma-kun-21473-chuong-202-hoi-nghi-chau-trai-cua-tam-kiet" title="Mairimashita! Iruma-kun Chương 202: Hội nghị ch&#225;u trai của Tam Kiệt" >Mairimashita! Iruma-kun Chương 202: Hội nghị ch&#225;u trai của Tam Kiệt</a>
            </span>
            <span class="publishedDate">08/05/2021 19:12</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-571277">
            <span class="title">
                <a id="c_571277" href="/c571277/mairimashita-iruma-kun-21473-chuong-201-hoi-nghi-nhung-nguoi-chau-cua-tam-kiet" title="Mairimashita! Iruma-kun Chương 201: Hội nghị những người ch&#225;u của Tam Kiệt" >Mairimashita! Iruma-kun Chương 201: Hội nghị những người ch&#225;u của Tam Kiệt</a>
            </span>
            <span class="publishedDate">23/04/2021 20:36</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-573003">
            <span class="title">
                <a id="c_573003" href="/c573003/mairimashita-iruma-kun-21473-chuong-2012-ngoai-truyen-kalego-phan-sau" title="Mairimashita! Iruma-kun Chương 201.2: Ngoại truyện Kalego: Phần sau" >Mairimashita! Iruma-kun Chương 201.2: Ngoại truyện Kalego: Phần sau</a>
            </span>
            <span class="publishedDate">30/04/2021 17:50</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-573002">
            <span class="title">
                <a id="c_573002" href="/c573002/mairimashita-iruma-kun-21473-chuong-2011-ngoai-truyen-kalego-phan-truoc" title="Mairimashita! Iruma-kun Chương 201.1: Ngoại truyện Kalego: Phần trước" >Mairimashita! Iruma-kun Chương 201.1: Ngoại truyện Kalego: Phần trước</a>
            </span>
            <span class="publishedDate">30/04/2021 17:50</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-569532">
            <span class="title">
                <a id="c_569532" href="/c569532/mairimashita-iruma-kun-21473-chuong-200-anh-kiet-tu-hoi" title="Mairimashita! Iruma-kun Chương 200: Anh Kiệt tụ hội" >Mairimashita! Iruma-kun Chương 200: Anh Kiệt tụ hội</a>
            </span>
            <span class="publishedDate">16/04/2021 20:32</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-567629">
            <span class="title">
                <a id="c_567629" href="/c567629/mairimashita-iruma-kun-21473-chuong-199-nguoi-dang-hien-ban-than-o-ma-gioi" title="Mairimashita! Iruma-kun Chương 199: Người d&#226;ng hiến bản th&#226;n ở Ma Giới" >Mairimashita! Iruma-kun Chương 199: Người d&#226;ng hiến bản th&#226;n ở Ma Giới</a>
            </span>
            <span class="publishedDate">09/04/2021 10:59</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-565677">
            <span class="title">
                <a id="c_565677" href="/c565677/mairimashita-iruma-kun-21473-chuong-198-buoi-thac-loan-cua-lop-ca-biet" title="Mairimashita! Iruma-kun Chương 198: Buổi th&#225;c loạn của lớp c&#225; biệt" >Mairimashita! Iruma-kun Chương 198: Buổi th&#225;c loạn của lớp c&#225; biệt</a>
            </span>
            <span class="publishedDate">04/04/2021 19:49</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-563460">
            <span class="title">
                <a id="c_563460" href="/c563460/mairimashita-iruma-kun-21473-chuong-197-ngay-chuyen-giao-thang" title="Mairimashita! Iruma-kun Chương 197: Ng&#224;y chuyển giao th&#225;ng" >Mairimashita! Iruma-kun Chương 197: Ng&#224;y chuyển giao th&#225;ng</a>
            </span>
            <span class="publishedDate">28/03/2021 23:48</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-655101">
            <span class="title">
                <a id="c_655101" href="/c655101/mairimashita-iruma-kun-21473-chuong-1974-colored-arc-dai-hoi-the-thao-akudol-part-4-chuong-193-197" title="Mairimashita! Iruma-kun Chương 197.4: [Colored] Arc Đại Hội Thể Thao Akudol [Part 4: Chương 193-197]" >Mairimashita! Iruma-kun Chương 197.4: [Colored] Arc Đại Hội Thể Thao Akudol [Part 4: Chương 193-197]</a>
            </span>
            <span class="publishedDate">31/12/2021 16:35</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-655098">
            <span class="title">
                <a id="c_655098" href="/c655098/mairimashita-iruma-kun-21473-chuong-1973-colored-arc-dai-hoi-the-thao-akudol-part-3-chuong-190-192" title="Mairimashita! Iruma-kun Chương 197.3: [Colored] Arc Đại Hội Thể Thao Akudol [Part 3: Chương 190-192]" >Mairimashita! Iruma-kun Chương 197.3: [Colored] Arc Đại Hội Thể Thao Akudol [Part 3: Chương 190-192]</a>
            </span>
            <span class="publishedDate">31/12/2021 16:34</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-655097">
            <span class="title">
                <a id="c_655097" href="/c655097/mairimashita-iruma-kun-21473-chuong-1972-colored-arc-dai-hoi-the-thao-akudol-part-2-chuong-187-189" title="Mairimashita! Iruma-kun Chương 197.2: [Colored] Arc Đại Hội Thể Thao Akudol [Part 2: Chương 187-189]" >Mairimashita! Iruma-kun Chương 197.2: [Colored] Arc Đại Hội Thể Thao Akudol [Part 2: Chương 187-189]</a>
            </span>
            <span class="publishedDate">31/12/2021 16:32</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-655096">
            <span class="title">
                <a id="c_655096" href="/c655096/mairimashita-iruma-kun-21473-chuong-1971-colored-arc-dai-hoi-the-thao-akudol-part-1-chuong-184-186" title="Mairimashita! Iruma-kun Chương 197.1: [Colored] Arc Đại Hội Thể Thao Akudol [Part 1: Chương 184-186]" >Mairimashita! Iruma-kun Chương 197.1: [Colored] Arc Đại Hội Thể Thao Akudol [Part 1: Chương 184-186]</a>
            </span>
            <span class="publishedDate">31/12/2021 16:32</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-561605">
            <span class="title">
                <a id="c_561605" href="/c561605/mairimashita-iruma-kun-21473-chuong-196-nhiet-huyet-day-tham-vong" title="Mairimashita! Iruma-kun Chương 196: Nhiệt huyết đầy tham vọng" >Mairimashita! Iruma-kun Chương 196: Nhiệt huyết đầy tham vọng</a>
            </span>
            <span class="publishedDate">22/03/2021 00:18</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-561349">
            <span class="title">
                <a id="c_561349" href="/c561349/mairimashita-iruma-kun-21473-chuong-195-nu-danh-ca-ngao-man-color" title="Mairimashita! Iruma-kun Chương 195: Nữ danh ca ngạo mạn (Color)" >Mairimashita! Iruma-kun Chương 195: Nữ danh ca ngạo mạn (Color)</a>
            </span>
            <span class="publishedDate">20/03/2021 17:31</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-559949">
            <span class="title">
                <a id="c_559949" href="/c559949/mairimashita-iruma-kun-21473-chuong-195-nu-danh-ca-ngao-man" title="Mairimashita! Iruma-kun Chương 195: Nữ danh ca ngạo mạn" >Mairimashita! Iruma-kun Chương 195: Nữ danh ca ngạo mạn</a>
            </span>
            <span class="publishedDate">14/03/2021 22:42</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-557751">
            <span class="title">
                <a id="c_557751" href="/c557751/mairimashita-iruma-kun-21473-chuong-194-rock-den-cung" title="Mairimashita! Iruma-kun Chương 194: Rock đến c&#249;ng" >Mairimashita! Iruma-kun Chương 194: Rock đến c&#249;ng</a>
            </span>
            <span class="publishedDate">08/03/2021 23:27</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-554734">
            <span class="title">
                <a id="c_554734" href="/c554734/mairimashita-iruma-kun-21473-chuong-193-tieng-noi-cua-chima" title="Mairimashita! Iruma-kun Chương 193: Tiếng n&#243;i của Chima" >Mairimashita! Iruma-kun Chương 193: Tiếng n&#243;i của Chima</a>
            </span>
            <span class="publishedDate">28/02/2021 01:57</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-552563">
            <span class="title">
                <a id="c_552563" href="/c552563/mairimashita-iruma-kun-21473-chuong-192-garry-tham-lam" title="Mairimashita! Iruma-kun Chương 192: Garry Tham Lam" >Mairimashita! Iruma-kun Chương 192: Garry Tham Lam</a>
            </span>
            <span class="publishedDate">21/02/2021 19:03</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-549855">
            <span class="title">
                <a id="c_549855" href="/c549855/mairimashita-iruma-kun-21473-chuong-191-doi-co-vu-irumi" title="Mairimashita! Iruma-kun Chương 191: Đội cổ vũ Irumi" >Mairimashita! Iruma-kun Chương 191: Đội cổ vũ Irumi</a>
            </span>
            <span class="publishedDate">12/02/2021 23:28</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-548668">
            <span class="title">
                <a id="c_548668" href="/c548668/mairimashita-iruma-kun-21473-chuong-190-phu-hao-va-vien-da-quy-to-mau" title="Mairimashita! Iruma-kun Chương 190: Ph&#250; h&#224;o v&#224; vi&#234;n đ&#225; qu&#253; [T&#244; m&#224;u]" >Mairimashita! Iruma-kun Chương 190: Ph&#250; h&#224;o v&#224; vi&#234;n đ&#225; qu&#253; [T&#244; m&#224;u]</a>
            </span>
            <span class="publishedDate">08/02/2021 22:11</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-547814">
            <span class="title">
                <a id="c_547814" href="/c547814/mairimashita-iruma-kun-21473-chuong-190-phu-hao-va-vien-da-quy" title="Mairimashita! Iruma-kun Chương 190: Ph&#250; h&#224;o v&#224; vi&#234;n đ&#225; qu&#253;" >Mairimashita! Iruma-kun Chương 190: Ph&#250; h&#224;o v&#224; vi&#234;n đ&#225; qu&#253;</a>
            </span>
            <span class="publishedDate">05/02/2021 23:47</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-545048">
            <span class="title">
                <a id="c_545048" href="/c545048/mairimashita-iruma-kun-21473-chuong-189-cung-thu-de-thuong-manh-nhat" title="Mairimashita! Iruma-kun Chương 189: Cung thủ dễ thương mạnh nhất" >Mairimashita! Iruma-kun Chương 189: Cung thủ dễ thương mạnh nhất</a>
            </span>
            <span class="publishedDate">29/01/2021 21:57</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-544041">
            <span class="title">
                <a id="c_544041" href="/c544041/mairimashita-iruma-kun-21473-chuong-188-lindy-gao-thet" title="Mairimashita! Iruma-kun Chương 188: Lindy g&#224;o th&#233;t" >Mairimashita! Iruma-kun Chương 188: Lindy g&#224;o th&#233;t</a>
            </span>
            <span class="publishedDate">22/01/2021 22:01</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-542695">
            <span class="title">
                <a id="c_542695" href="/c542695/mairimashita-iruma-kun-21473-chuong-187-chay-nhanh-het-minh" title="Mairimashita! Iruma-kun Chương 187: Chạy nhanh hết m&#236;nh" >Mairimashita! Iruma-kun Chương 187: Chạy nhanh hết m&#236;nh</a>
            </span>
            <span class="publishedDate">16/01/2021 14:11</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-540261">
            <span class="title">
                <a id="c_540261" href="/c540261/mairimashita-iruma-kun-21473-chuong-186-doi-devimus" title="Mairimashita! Iruma-kun Chương 186: Đội Devimus" >Mairimashita! Iruma-kun Chương 186: Đội Devimus</a>
            </span>
            <span class="publishedDate">09/01/2021 23:29</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-536078">
            <span class="title">
                <a id="c_536078" href="/c536078/mairimashita-iruma-kun-21473-chuong-185-dai-hoi-the-thao-akudol" title="Mairimashita! Iruma-kun Chương 185: Đại hội thể thao Akudol!!" >Mairimashita! Iruma-kun Chương 185: Đại hội thể thao Akudol!!</a>
            </span>
            <span class="publishedDate">26/12/2020 01:55</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-532713">
            <span class="title">
                <a id="c_532713" href="/c532713/mairimashita-iruma-kun-21473-chuong-184-loi-hua-voi-kerori" title="Mairimashita! Iruma-kun Chương 184: Lời hứa với Kerori" >Mairimashita! Iruma-kun Chương 184: Lời hứa với Kerori</a>
            </span>
            <span class="publishedDate">12/12/2020 01:29</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-529172">
            <span class="title">
                <a id="c_529172" href="/c529172/mairimashita-iruma-kun-21473-chuong-183-suzuki-iruma-nghi-le-giang-ma" title="Mairimashita! Iruma-kun Chương 183: Suzuki Iruma - “Nghi Thức Gi&#225;ng Ma”" >Mairimashita! Iruma-kun Chương 183: Suzuki Iruma - “Nghi Thức Gi&#225;ng Ma”</a>
            </span>
            <span class="publishedDate">05/12/2020 00:08</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-526730">
            <span class="title">
                <a id="c_526730" href="/c526730/mairimashita-iruma-kun-21473-chuong-182-le-tu-nhien-cua-ma-gioi" title="Mairimashita! Iruma-kun Chương 182: Lẽ tự nhi&#234;n của Ma Giới" >Mairimashita! Iruma-kun Chương 182: Lẽ tự nhi&#234;n của Ma Giới</a>
            </span>
            <span class="publishedDate">28/11/2020 18:39</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-525216">
            <span class="title">
                <a id="c_525216" href="/c525216/mairimashita-iruma-kun-21473-chuong-181-buoi-hop-tan-tinh-cua-lied" title="Mairimashita! Iruma-kun Chương 181: Buổi họp t&#225;n tỉnh của Lied" >Mairimashita! Iruma-kun Chương 181: Buổi họp t&#225;n tỉnh của Lied</a>
            </span>
            <span class="publishedDate">23/11/2020 20:47</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-522943">
            <span class="title">
                <a id="c_522943" href="/c522943/mairimashita-iruma-kun-21473-chuong-180-khoang-cach-1-centimet" title="Mairimashita! Iruma-kun Chương 180: Khoảng c&#225;ch 1 centimet" >Mairimashita! Iruma-kun Chương 180: Khoảng c&#225;ch 1 centimet</a>
            </span>
            <span class="publishedDate">15/11/2020 15:14</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-519515">
            <span class="title">
                <a id="c_519515" href="/c519515/mairimashita-iruma-kun-21473-chuong-179-khoang-cach-1-nam" title="Mairimashita! Iruma-kun Chương 179: Khoảng c&#225;ch 1 năm" >Mairimashita! Iruma-kun Chương 179: Khoảng c&#225;ch 1 năm</a>
            </span>
            <span class="publishedDate">08/11/2020 01:14</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-515474">
            <span class="title">
                <a id="c_515474" href="/c515474/mairimashita-iruma-kun-21473-chuong-178-hoi-nghi-ban-than" title="Mairimashita! Iruma-kun Chương 178: Hội nghị &quot;Bạn th&#226;n&quot;" >Mairimashita! Iruma-kun Chương 178: Hội nghị &quot;Bạn th&#226;n&quot;</a>
            </span>
            <span class="publishedDate">02/11/2020 01:08</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-512966">
            <span class="title">
                <a id="c_512966" href="/c512966/mairimashita-iruma-kun-21473-chuong-177-cung-ban-be-hai-nguoi" title="Mairimashita! Iruma-kun Chương 177: C&#249;ng bạn b&#232;, hai người" >Mairimashita! Iruma-kun Chương 177: C&#249;ng bạn b&#232;, hai người</a>
            </span>
            <span class="publishedDate">25/10/2020 19:01</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-510213">
            <span class="title">
                <a id="c_510213" href="/c510213/mairimashita-iruma-kun-21473-chuong-176-bo-ba-men-thuong" title="Mairimashita! Iruma-kun Chương 176: Bộ ba mến thương" >Mairimashita! Iruma-kun Chương 176: Bộ ba mến thương</a>
            </span>
            <span class="publishedDate">18/10/2020 13:51</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-508438">
            <span class="title">
                <a id="c_508438" href="/c508438/mairimashita-iruma-kun-21473-chuong-175-cong-su-cua-iruma" title="Mairimashita! Iruma-kun Chương 175: Cộng sự của Iruma" >Mairimashita! Iruma-kun Chương 175: Cộng sự của Iruma</a>
            </span>
            <span class="publishedDate">12/10/2020 01:51</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-504366">
            <span class="title">
                <a id="c_504366" href="/c504366/mairimashita-iruma-kun-21473-chuong-174-ac-ma-den-va-trang" title="Mairimashita! Iruma-kun Chương 174: &#193;c ma đen v&#224; trắng" >Mairimashita! Iruma-kun Chương 174: &#193;c ma đen v&#224; trắng</a>
            </span>
            <span class="publishedDate">04/10/2020 02:44</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-503470">
            <span class="title">
                <a id="c_503470" href="/c503470/mairimashita-iruma-kun-21473-chuong-173-sau-trong-doi-mat" title="Mairimashita! Iruma-kun Chương 173: S&#226;u trong đ&#244;i mắt" >Mairimashita! Iruma-kun Chương 173: S&#226;u trong đ&#244;i mắt</a>
            </span>
            <span class="publishedDate">30/09/2020 14:06</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-502736">
            <span class="title">
                <a id="c_502736" href="/c502736/mairimashita-iruma-kun-21473-chuong-172-13-thanh-vien-ca-biet" title="Mairimashita! Iruma-kun Chương 172: 13 th&#224;nh vi&#234;n c&#225; biệt" >Mairimashita! Iruma-kun Chương 172: 13 th&#224;nh vi&#234;n c&#225; biệt</a>
            </span>
            <span class="publishedDate">26/09/2020 17:23</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-502408">
            <span class="title">
                <a id="c_502408" href="/c502408/mairimashita-iruma-kun-21473-chuong-171-bua-tiec-mung-chien-thang-vang-doi" title="Mairimashita! Iruma-kun Chương 171: Bữa tiệc mừng chiến thắng vang dội" >Mairimashita! Iruma-kun Chương 171: Bữa tiệc mừng chiến thắng vang dội</a>
            </span>
            <span class="publishedDate">25/09/2020 02:46</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-499638">
            <span class="title">
                <a id="c_499638" href="/c499638/mairimashita-iruma-kun-21473-chuong-170-phao-hieu-mung-chien-thang" title="Mairimashita! Iruma-kun Chương 170: Ph&#225;o hiệu mừng chiến thắng" >Mairimashita! Iruma-kun Chương 170: Ph&#225;o hiệu mừng chiến thắng</a>
            </span>
            <span class="publishedDate">15/09/2020 01:28</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-496105">
            <span class="title">
                <a id="c_496105" href="/c496105/mairimashita-iruma-kun-21473-chuong-169-am-thanh-cua-ma-vuong" title="Mairimashita! Iruma-kun Chương 169: &#194;m thanh của ma vương" >Mairimashita! Iruma-kun Chương 169: &#194;m thanh của ma vương</a>
            </span>
            <span class="publishedDate">05/09/2020 18:17</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-491321">
            <span class="title">
                <a id="c_491321" href="/c491321/mairimashita-iruma-kun-21473-chuong-168-lop-ca-biet-lilith-carpet" title="Mairimashita! Iruma-kun Chương 168: Lớp C&#225; Biệt ~ Lilith Carpet ~" >Mairimashita! Iruma-kun Chương 168: Lớp C&#225; Biệt ~ Lilith Carpet ~</a>
            </span>
            <span class="publishedDate">28/08/2020 13:02</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-485509">
            <span class="title">
                <a id="c_485509" href="/c485509/mairimashita-iruma-kun-21473-chuong-167-am-thanh-duoc-mong-doi" title="Mairimashita! Iruma-kun Chương 167: &#194;m thanh được mong đợi" >Mairimashita! Iruma-kun Chương 167: &#194;m thanh được mong đợi</a>
            </span>
            <span class="publishedDate">16/08/2020 14:14</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-481980">
            <span class="title">
                <a id="c_481980" href="/c481980/mairimashita-iruma-kun-21473-chuong-166-buoc-duong-con-se-chon" title="Mairimashita! Iruma-kun Chương 166: Bước đường con sẽ chọn" >Mairimashita! Iruma-kun Chương 166: Bước đường con sẽ chọn</a>
            </span>
            <span class="publishedDate">07/08/2020 02:07</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-481979">
            <span class="title">
                <a id="c_481979" href="/c481979/mairimashita-iruma-kun-21473-chuong-165-hoi-am-nhac-chinh-thuc-mo-man" title="Mairimashita! Iruma-kun Chương 165: Hội &#226;m nhạc ch&#237;nh thức mở m&#224;n!!" >Mairimashita! Iruma-kun Chương 165: Hội &#226;m nhạc ch&#237;nh thức mở m&#224;n!!</a>
            </span>
            <span class="publishedDate">07/08/2020 02:06</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-479277">
            <span class="title">
                <a id="c_479277" href="/c479277/mairimashita-iruma-kun-21473-chuong-164-tuyen-bo-chien-tranh" title="Mairimashita! Iruma-kun Chương 164: Tuy&#234;n bố chiến tranh" >Mairimashita! Iruma-kun Chương 164: Tuy&#234;n bố chiến tranh</a>
            </span>
            <span class="publishedDate">30/07/2020 01:28</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-475972">
            <span class="title">
                <a id="c_475972" href="/c475972/mairimashita-iruma-kun-21473-chuong-163-amduscias" title="Mairimashita! Iruma-kun Chương 163: Amduscias" >Mairimashita! Iruma-kun Chương 163: Amduscias</a>
            </span>
            <span class="publishedDate">18/07/2020 23:38</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-471248">
            <span class="title">
                <a id="c_471248" href="/c471248/mairimashita-iruma-kun-21473-chuong-162-tro-chuyen" title="Mairimashita! Iruma-kun Chương 162: Tr&#242; chuyện" >Mairimashita! Iruma-kun Chương 162: Tr&#242; chuyện</a>
            </span>
            <span class="publishedDate">11/07/2020 19:45</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-470699">
            <span class="title">
                <a id="c_470699" href="/c470699/mairimashita-iruma-kun-21473-chuong-161-thanh-le-ngoi-ca" title="Mairimashita! Iruma-kun Chương 161: Th&#225;nh lễ ngợi ca" >Mairimashita! Iruma-kun Chương 161: Th&#225;nh lễ ngợi ca</a>
            </span>
            <span class="publishedDate">11/07/2020 01:16</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-469886">
            <span class="title">
                <a id="c_469886" href="/c469886/mairimashita-iruma-kun-21473-chuong-160-du-khong-the-nhin-thay" title="Mairimashita! Iruma-kun Chương 160: D&#249; kh&#244;ng thể nh&#236;n thấy" >Mairimashita! Iruma-kun Chương 160: D&#249; kh&#244;ng thể nh&#236;n thấy</a>
            </span>
            <span class="publishedDate">08/07/2020 23:09</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-510758">
            <span class="title">
                <a id="c_510758" href="/c510758/mairimashita-iruma-kun-21473-chuong-1605-phu-luc-tap-18" title="Mairimashita! Iruma-kun Chương 160.5: Phụ lục tập 18" >Mairimashita! Iruma-kun Chương 160.5: Phụ lục tập 18</a>
            </span>
            <span class="publishedDate">19/10/2020 23:42</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-468111">
            <span class="title">
                <a id="c_468111" href="/c468111/mairimashita-iruma-kun-21473-chuong-159-tuong-lai-tu-bay-gio" title="Mairimashita! Iruma-kun Chương 159: Tương lai từ b&#226;y giờ" >Mairimashita! Iruma-kun Chương 159: Tương lai từ b&#226;y giờ</a>
            </span>
            <span class="publishedDate">07/07/2020 00:39</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-467047">
            <span class="title">
                <a id="c_467047" href="/c467047/mairimashita-iruma-kun-21473-chuong-158-theo-duoi" title="Mairimashita! Iruma-kun Chương 158: Theo đuổi" >Mairimashita! Iruma-kun Chương 158: Theo đuổi</a>
            </span>
            <span class="publishedDate">05/07/2020 10:49</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-466495">
            <span class="title">
                <a id="c_466495" href="/c466495/mairimashita-iruma-kun-21473-chuong-157-ban-be" title="Mairimashita! Iruma-kun Chương 157: Bạn b&#232;" >Mairimashita! Iruma-kun Chương 157: Bạn b&#232;</a>
            </span>
            <span class="publishedDate">03/07/2020 14:57</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-464968">
            <span class="title">
                <a id="c_464968" href="/c464968/mairimashita-iruma-kun-21473-chuong-156-lilith-carpet" title="Mairimashita! Iruma-kun Chương 156: Lilith Carpet" >Mairimashita! Iruma-kun Chương 156: Lilith Carpet</a>
            </span>
            <span class="publishedDate">30/06/2020 02:11</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-464792">
            <span class="title">
                <a id="c_464792" href="/c464792/mairimashita-iruma-kun-21473-chuong-155-chiec-dan-piano-cua-ma-gioi" title="Mairimashita! Iruma-kun Chương 155: Chiếc đ&#224;n Piano của Ma Giới" >Mairimashita! Iruma-kun Chương 155: Chiếc đ&#224;n Piano của Ma Giới</a>
            </span>
            <span class="publishedDate">28/06/2020 23:12</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-463750">
            <span class="title">
                <a id="c_463750" href="/c463750/mairimashita-iruma-kun-21473-chuong-154-ban-chat-cua-akudol" title="Mairimashita! Iruma-kun Chương 154: Bản chất của Akudol" >Mairimashita! Iruma-kun Chương 154: Bản chất của Akudol</a>
            </span>
            <span class="publishedDate">24/06/2020 18:58</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-463490">
            <span class="title">
                <a id="c_463490" href="/c463490/mairimashita-iruma-kun-21473-chuong-153-hell-dance-vu-dieu-dia-nguc" title="Mairimashita! Iruma-kun Chương 153: Hell Dance (Vũ điệu địa ngục)" >Mairimashita! Iruma-kun Chương 153: Hell Dance (Vũ điệu địa ngục)</a>
            </span>
            <span class="publishedDate">23/06/2020 19:55</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-462715">
            <span class="title">
                <a id="c_462715" href="/c462715/mairimashita-iruma-kun-21473-chuong-152-buoi-dieu-hanh-cua-hoi-hoc-sinh" title="Mairimashita! Iruma-kun Chương 152: Buổi diễu h&#224;nh của hội học sinh" >Mairimashita! Iruma-kun Chương 152: Buổi diễu h&#224;nh của hội học sinh</a>
            </span>
            <span class="publishedDate">20/06/2020 13:08</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-462270">
            <span class="title">
                <a id="c_462270" href="/c462270/mairimashita-iruma-kun-21473-chuong-151-cuoc-khieu-chien-cua-13-nguoi" title="Mairimashita! Iruma-kun Chương 151: Cuộc khi&#234;u chiến của 13 người" >Mairimashita! Iruma-kun Chương 151: Cuộc khi&#234;u chiến của 13 người</a>
            </span>
            <span class="publishedDate">18/06/2020 00:30</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-508860">
            <span class="title">
                <a id="c_508860" href="/c508860/mairimashita-iruma-kun-21473-chuong-1515-omake-volume-17" title="Mairimashita! Iruma-kun Chương 151.5: Omake Volume 17" >Mairimashita! Iruma-kun Chương 151.5: Omake Volume 17</a>
            </span>
            <span class="publishedDate">13/10/2020 20:55</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-445685">
            <span class="title">
                <a id="c_445685" href="/c445685/mairimashita-iruma-kun-21473-chuong-150-co-chap" title="Mairimashita! Iruma-kun Chương 150: Cố chấp" >Mairimashita! Iruma-kun Chương 150: Cố chấp</a>
            </span>
            <span class="publishedDate">02/05/2020 10:23</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-445584">
            <span class="title">
                <a id="c_445584" href="/c445584/mairimashita-iruma-kun-21473-chuong-149-am-thanh-cua-pixie" title="Mairimashita! Iruma-kun Chương 149: &#194;m thanh của Pixie" >Mairimashita! Iruma-kun Chương 149: &#194;m thanh của Pixie</a>
            </span>
            <span class="publishedDate">01/05/2020 17:25</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-436553">
            <span class="title">
                <a id="c_436553" href="/c436553/mairimashita-iruma-kun-21473-chuong-148-purson-soy" title="Mairimashita! Iruma-kun Chương 148: Purson Soy" >Mairimashita! Iruma-kun Chương 148: Purson Soy</a>
            </span>
            <span class="publishedDate">29/03/2020 19:49</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-433700">
            <span class="title">
                <a id="c_433700" href="/c433700/mairimashita-iruma-kun-21473-chuong-147-mot-ten-ac-ma-khac" title="Mairimashita! Iruma-kun Chương 147: Một t&#234;n &#225;c ma kh&#225;c" >Mairimashita! Iruma-kun Chương 147: Một t&#234;n &#225;c ma kh&#225;c</a>
            </span>
            <span class="publishedDate">19/03/2020 02:54</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-431756">
            <span class="title">
                <a id="c_431756" href="/c431756/mairimashita-iruma-kun-21473-chuong-146-su-hon-loan-cua-ma-gioi" title="Mairimashita! Iruma-kun Chương 146: Sự hỗn loạn của Ma Giới" >Mairimashita! Iruma-kun Chương 146: Sự hỗn loạn của Ma Giới</a>
            </span>
            <span class="publishedDate">12/03/2020 20:33</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-430647">
            <span class="title">
                <a id="c_430647" href="/c430647/mairimashita-iruma-kun-21473-chuong-145-chau-nhau-cua-cac-giao-vien" title="Mairimashita! Iruma-kun Chương 145: Chầu nhậu của c&#225;c gi&#225;o vi&#234;n" >Mairimashita! Iruma-kun Chương 145: Chầu nhậu của c&#225;c gi&#225;o vi&#234;n</a>
            </span>
            <span class="publishedDate">08/03/2020 23:59</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-428912">
            <span class="title">
                <a id="c_428912" href="/c428912/mairimashita-iruma-kun-21473-chuong-144-nguoi-ban-hu-hong" title="Mairimashita! Iruma-kun Chương 144: Người bạn hư hỏng" >Mairimashita! Iruma-kun Chương 144: Người bạn hư hỏng</a>
            </span>
            <span class="publishedDate">01/03/2020 03:13</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-425323">
            <span class="title">
                <a id="c_425323" href="/c425323/mairimashita-iruma-kun-21473-chuong-143-lop-hoc-nau-an-day-chan-thanh" title="Mairimashita! Iruma-kun Chương 143: Lớp học nấu ăn đầy ch&#226;n th&#224;nh!!" >Mairimashita! Iruma-kun Chương 143: Lớp học nấu ăn đầy ch&#226;n th&#224;nh!!</a>
            </span>
            <span class="publishedDate">16/02/2020 03:01</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-423824">
            <span class="title">
                <a id="c_423824" href="/c423824/mairimashita-iruma-kun-21473-chuong-142-bi-mat-bi-vach-tran" title="Mairimashita! Iruma-kun Chương 142: B&#237; mật bị vạch trần" >Mairimashita! Iruma-kun Chương 142: B&#237; mật bị vạch trần</a>
            </span>
            <span class="publishedDate">09/02/2020 00:09</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-508859">
            <span class="title">
                <a id="c_508859" href="/c508859/mairimashita-iruma-kun-21473-chuong-1415-omake-volume-16" title="Mairimashita! Iruma-kun Chương 142.5: Omake Volume 16" >Mairimashita! Iruma-kun Chương 142.5: Omake Volume 16</a>
            </span>
            <span class="publishedDate">13/10/2020 20:55</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-461848">
            <span class="title">
                <a id="c_461848" href="/c461848/mairimashita-iruma-kun-21473-chuong-141-nhung-loi-gui-toi-ban-be" title="Mairimashita! Iruma-kun Chương 141: Những lời gửi tới bạn b&#232;" >Mairimashita! Iruma-kun Chương 141: Những lời gửi tới bạn b&#232;</a>
            </span>
            <span class="publishedDate">16/06/2020 00:49</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-460654">
            <span class="title">
                <a id="c_460654" href="/c460654/mairimashita-iruma-kun-21473-chuong-140-mung-ve-nha" title="Mairimashita! Iruma-kun Chương 140: Mừng về nh&#224;" >Mairimashita! Iruma-kun Chương 140: Mừng về nh&#224;</a>
            </span>
            <span class="publishedDate">13/06/2020 16:40</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-460134">
            <span class="title">
                <a id="c_460134" href="/c460134/mairimashita-iruma-kun-21473-chuong-139-nhung-loi-khen-ngoi" title="Mairimashita! Iruma-kun Chương 139: Những lời khen ngợi" >Mairimashita! Iruma-kun Chương 139: Những lời khen ngợi</a>
            </span>
            <span class="publishedDate">12/06/2020 00:28</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-458941">
            <span class="title">
                <a id="c_458941" href="/c458941/mairimashita-iruma-kun-21473-chuong-138-dieu-kien-de-no-hoa" title="Mairimashita! Iruma-kun Chương 138: Điều kiện để nở hoa" >Mairimashita! Iruma-kun Chương 138: Điều kiện để nở hoa</a>
            </span>
            <span class="publishedDate">09/06/2020 23:13</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-458718">
            <span class="title">
                <a id="c_458718" href="/c458718/mairimashita-iruma-kun-21473-chuong-137-nguoi-chien-thang" title="Mairimashita! Iruma-kun Chương 137: Người chiến thắng" >Mairimashita! Iruma-kun Chương 137: Người chiến thắng</a>
            </span>
            <span class="publishedDate">08/06/2020 21:19</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-458232">
            <span class="title">
                <a id="c_458232" href="/c458232/mairimashita-iruma-kun-21473-chuong-136-legend-leaf" title="Mairimashita! Iruma-kun Chương 136: Legend Leaf" >Mairimashita! Iruma-kun Chương 136: Legend Leaf</a>
            </span>
            <span class="publishedDate">05/06/2020 23:23</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-457694">
            <span class="title">
                <a id="c_457694" href="/c457694/mairimashita-iruma-kun-21473-chuong-135-hoi-ket-cua-le-thu-hoach" title="Mairimashita! Iruma-kun Chương 135: Hồi kết của Lễ Thu Hoạch" >Mairimashita! Iruma-kun Chương 135: Hồi kết của Lễ Thu Hoạch</a>
            </span>
            <span class="publishedDate">04/06/2020 01:33</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-456900">
            <span class="title">
                <a id="c_456900" href="/c456900/mairimashita-iruma-kun-21473-chuong-134-nguyen-vong-duoc-pho-thac" title="Mairimashita! Iruma-kun Chương 134: Nguyện vọng được ph&#243; th&#225;c" >Mairimashita! Iruma-kun Chương 134: Nguyện vọng được ph&#243; th&#225;c</a>
            </span>
            <span class="publishedDate">03/06/2020 10:10</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-456610">
            <span class="title">
                <a id="c_456610" href="/c456610/mairimashita-iruma-kun-21473-chuong-133-gia-tri-thuc-su-cua-cung-thu" title="Mairimashita! Iruma-kun Chương 133: Gi&#225; trị thực sự của cung thủ" >Mairimashita! Iruma-kun Chương 133: Gi&#225; trị thực sự của cung thủ</a>
            </span>
            <span class="publishedDate">01/06/2020 20:52</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-508858">
            <span class="title">
                <a id="c_508858" href="/c508858/mairimashita-iruma-kun-21473-chuong-1335-omake-volume15" title="Mairimashita! Iruma-kun Chương 133.5: Omake Volume15" >Mairimashita! Iruma-kun Chương 133.5: Omake Volume15</a>
            </span>
            <span class="publishedDate">13/10/2020 20:54</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-455564">
            <span class="title">
                <a id="c_455564" href="/c455564/mairimashita-iruma-kun-21473-chuong-132-tam-tinh-xao-dong" title="Mairimashita! Iruma-kun Chương 132: T&#226;m t&#236;nh xao động" >Mairimashita! Iruma-kun Chương 132: T&#226;m t&#236;nh xao động</a>
            </span>
            <span class="publishedDate">29/05/2020 16:52</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-455458">
            <span class="title">
                <a id="c_455458" href="/c455458/mairimashita-iruma-kun-21473-chuong-131-tu-nhan-cua-mi-luc" title="Mairimashita! Iruma-kun Chương 131: T&#249; nh&#226;n của mị lực" >Mairimashita! Iruma-kun Chương 131: T&#249; nh&#226;n của mị lực</a>
            </span>
            <span class="publishedDate">28/05/2020 23:35</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-455109">
            <span class="title">
                <a id="c_455109" href="/c455109/mairimashita-iruma-kun-21473-chuong-130-dai-chien-lop-ca-biet" title="Mairimashita! Iruma-kun Chương 130: Đại chiến lớp c&#225; biệt" >Mairimashita! Iruma-kun Chương 130: Đại chiến lớp c&#225; biệt</a>
            </span>
            <span class="publishedDate">26/05/2020 22:58</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-454909">
            <span class="title">
                <a id="c_454909" href="/c454909/mairimashita-iruma-kun-21473-chuong-129-tiep-quan-lau-dai-nao" title="Mairimashita! Iruma-kun Chương 129: Tiếp quản l&#226;u đ&#224;i n&#224;o" >Mairimashita! Iruma-kun Chương 129: Tiếp quản l&#226;u đ&#224;i n&#224;o</a>
            </span>
            <span class="publishedDate">26/05/2020 01:03</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-454285">
            <span class="title">
                <a id="c_454285" href="/c454285/mairimashita-iruma-kun-21473-chuong-128-trai-tim-loan-nhip" title="Mairimashita! Iruma-kun Chương 128: Tr&#225;i tim loạn nhịp" >Mairimashita! Iruma-kun Chương 128: Tr&#225;i tim loạn nhịp</a>
            </span>
            <span class="publishedDate">23/05/2020 16:27</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-453153">
            <span class="title">
                <a id="c_453153" href="/c453153/mairimashita-iruma-kun-21473-chuong-127-phien-nao-cua-lied" title="Mairimashita! Iruma-kun Chương 127: Phiền n&#227;o của Lied" >Mairimashita! Iruma-kun Chương 127: Phiền n&#227;o của Lied</a>
            </span>
            <span class="publishedDate">21/05/2020 02:20</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-452110">
            <span class="title">
                <a id="c_452110" href="/c452110/mairimashita-iruma-kun-21473-chuong-126-ma-thuat-cua-rieng-toi" title="Mairimashita! Iruma-kun Chương 126: Ma thuật của ri&#234;ng t&#244;i" >Mairimashita! Iruma-kun Chương 126: Ma thuật của ri&#234;ng t&#244;i</a>
            </span>
            <span class="publishedDate">18/05/2020 01:35</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-448980">
            <span class="title">
                <a id="c_448980" href="/c448980/mairimashita-iruma-kun-21473-chuong-125-ma-vuong-tre-tuoi" title="Mairimashita! Iruma-kun Chương 125: Ma Vương trẻ tuổi" >Mairimashita! Iruma-kun Chương 125: Ma Vương trẻ tuổi</a>
            </span>
            <span class="publishedDate">12/05/2020 20:22</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-447902">
            <span class="title">
                <a id="c_447902" href="/c447902/mairimashita-iruma-kun-21473-chuong-124-gui-uoc-nguyen-vao-canh-cung" title="Mairimashita! Iruma-kun Chương 124: Gửi ước nguyện v&#224;o c&#225;nh cung" >Mairimashita! Iruma-kun Chương 124: Gửi ước nguyện v&#224;o c&#225;nh cung</a>
            </span>
            <span class="publishedDate">09/05/2020 23:35</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-447411">
            <span class="title">
                <a id="c_447411" href="/c447411/mairimashita-iruma-kun-21473-chuong-123-nhung-loi-mai-chang-the-thot-ra" title="Mairimashita! Iruma-kun Chương 123: Những lời m&#227;i chẳng thể thốt ra" >Mairimashita! Iruma-kun Chương 123: Những lời m&#227;i chẳng thể thốt ra</a>
            </span>
            <span class="publishedDate">08/05/2020 00:09</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-447226">
            <span class="title">
                <a id="c_447226" href="/c447226/mairimashita-iruma-kun-21473-chuong-122-tro-ve-thoi" title="Mairimashita! Iruma-kun Chương 122: Trở về th&#244;i" >Mairimashita! Iruma-kun Chương 122: Trở về th&#244;i</a>
            </span>
            <span class="publishedDate">07/05/2020 01:02</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-444587">
            <span class="title">
                <a id="c_444587" href="/c444587/mairimashita-iruma-kun-21473-chuong-121-ma-than-toto" title="Mairimashita! Iruma-kun Chương 121: Ma Thần Toto" >Mairimashita! Iruma-kun Chương 121: Ma Thần Toto</a>
            </span>
            <span class="publishedDate">27/04/2020 21:43</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-443768">
            <span class="title">
                <a id="c_443768" href="/c443768/mairimashita-iruma-kun-21473-chuong-120-hat-khoi-nguon" title="Mairimashita! Iruma-kun Chương 120: Hạt khởi nguồn" >Mairimashita! Iruma-kun Chương 120: Hạt khởi nguồn</a>
            </span>
            <span class="publishedDate">24/04/2020 21:04</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-443152">
            <span class="title">
                <a id="c_443152" href="/c443152/mairimashita-iruma-kun-21473-chuong-119-vay-bat-hoc-sinh" title="Mairimashita! Iruma-kun Chương 119: V&#226;y bắt học sinh" >Mairimashita! Iruma-kun Chương 119: V&#226;y bắt học sinh</a>
            </span>
            <span class="publishedDate">22/04/2020 12:29</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-442910">
            <span class="title">
                <a id="c_442910" href="/c442910/mairimashita-iruma-kun-21473-chuong-118-iruma-ma-toi-biet" title="Mairimashita! Iruma-kun Chương 118: Iruma m&#224; t&#244;i biết" >Mairimashita! Iruma-kun Chương 118: Iruma m&#224; t&#244;i biết</a>
            </span>
            <span class="publishedDate">20/04/2020 23:33</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-441770">
            <span class="title">
                <a id="c_441770" href="/c441770/mairimashita-iruma-kun-21473-chuong-117-keroli-nu-vuong-cua-muong-thu" title="Mairimashita! Iruma-kun Chương 117: Keroli, nữ vương của mu&#244;ng th&#250;" >Mairimashita! Iruma-kun Chương 117: Keroli, nữ vương của mu&#244;ng th&#250;</a>
            </span>
            <span class="publishedDate">17/04/2020 22:05</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-440698">
            <span class="title">
                <a id="c_440698" href="/c440698/mairimashita-iruma-kun-21473-chuong-116-ke-sach-loi-nguoc-dong" title="Mairimashita! Iruma-kun Chương 116: Kế s&#225;ch lội ngược d&#242;ng" >Mairimashita! Iruma-kun Chương 116: Kế s&#225;ch lội ngược d&#242;ng</a>
            </span>
            <span class="publishedDate">13/04/2020 19:30</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-439405">
            <span class="title">
                <a id="c_439405" href="/c439405/mairimashita-iruma-kun-21473-chuong-115-azu-trong-chu-ki-ac" title="Mairimashita! Iruma-kun Chương 115: Azu trong Chu K&#236; &#193;c" >Mairimashita! Iruma-kun Chương 115: Azu trong Chu K&#236; &#193;c</a>
            </span>
            <span class="publishedDate">08/04/2020 23:42</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-439010">
            <span class="title">
                <a id="c_439010" href="/c439010/mairimashita-iruma-kun-21473-chuong-114-su-phu-tren-chien-truong" title="Mairimashita! Iruma-kun Chương 114: Sư phụ tr&#234;n chiến trường" >Mairimashita! Iruma-kun Chương 114: Sư phụ tr&#234;n chiến trường</a>
            </span>
            <span class="publishedDate">07/04/2020 13:39</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-437987">
            <span class="title">
                <a id="c_437987" href="/c437987/mairimashita-iruma-kun-21473-chuong-113-loi-khieu-khich-tu-anh-em-nhay-nhua" title="Mairimashita! Iruma-kun Chương 113: Lời khi&#234;u kh&#237;ch từ anh em nhầy nhụa" >Mairimashita! Iruma-kun Chương 113: Lời khi&#234;u kh&#237;ch từ anh em nhầy nhụa</a>
            </span>
            <span class="publishedDate">04/04/2020 22:48</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-437499">
            <span class="title">
                <a id="c_437499" href="/c437499/mairimashita-iruma-kun-21473-chuong-112-nhung-de-tu-dang-tu-hao" title="Mairimashita! Iruma-kun Chương 112: Những đệ tử đ&#225;ng tự h&#224;o" >Mairimashita! Iruma-kun Chương 112: Những đệ tử đ&#225;ng tự h&#224;o</a>
            </span>
            <span class="publishedDate">02/04/2020 18:23</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-436758">
            <span class="title">
                <a id="c_436758" href="/c436758/mairimashita-iruma-kun-21473-chuong-111-lieu-co-the-ket-ban-voi-100-nguoi-khong-day" title="Mairimashita! Iruma-kun Chương 111: Liệu c&#243; thể kết bạn với 100 người kh&#244;ng đ&#226;y" >Mairimashita! Iruma-kun Chương 111: Liệu c&#243; thể kết bạn với 100 người kh&#244;ng đ&#226;y</a>
            </span>
            <span class="publishedDate">30/03/2020 20:52</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-435900">
            <span class="title">
                <a id="c_435900" href="/c435900/mairimashita-iruma-kun-21473-chuong-110-man-dem-vang-vong-tieng-thet-gao" title="Mairimashita! Iruma-kun Chương 110: M&#224;n đ&#234;m vang vọng tiếng th&#233;t g&#224;o" >Mairimashita! Iruma-kun Chương 110: M&#224;n đ&#234;m vang vọng tiếng th&#233;t g&#224;o</a>
            </span>
            <span class="publishedDate">27/03/2020 23:13</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-434886">
            <span class="title">
                <a id="c_434886" href="/c434886/mairimashita-iruma-kun-21473-chuong-109-hop-do-choi-cua-clara" title="Mairimashita! Iruma-kun Chương 109: Hộp đồ chơi của Clara" >Mairimashita! Iruma-kun Chương 109: Hộp đồ chơi của Clara</a>
            </span>
            <span class="publishedDate">23/03/2020 23:30</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-434276">
            <span class="title">
                <a id="c_434276" href="/c434276/mairimashita-iruma-kun-21473-chuong-108-su-thuan-khiet-ta-ac" title="Mairimashita! Iruma-kun Chương 108: Sự thuần khiết t&#224; &#225;c" >Mairimashita! Iruma-kun Chương 108: Sự thuần khiết t&#224; &#225;c</a>
            </span>
            <span class="publishedDate">21/03/2020 16:33</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-433392">
            <span class="title">
                <a id="c_433392" href="/c433392/mairimashita-iruma-kun-21473-chuong-107-survival-high-y-chi-sinh-ton-len-cao" title="Mairimashita! Iruma-kun Chương 107: Survival High - &#221; Ch&#237; Sinh Tồn L&#234;n Cao" >Mairimashita! Iruma-kun Chương 107: Survival High - &#221; Ch&#237; Sinh Tồn L&#234;n Cao</a>
            </span>
            <span class="publishedDate">18/03/2020 10:11</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-432857">
            <span class="title">
                <a id="c_432857" href="/c432857/mairimashita-iruma-kun-21473-chuong-106-chien-thuat-cua-ac-ma" title="Mairimashita! Iruma-kun Chương 106: Chiến thuật của &#225;c ma" >Mairimashita! Iruma-kun Chương 106: Chiến thuật của &#225;c ma</a>
            </span>
            <span class="publishedDate">16/03/2020 10:34</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-431526">
            <span class="title">
                <a id="c_431526" href="/c431526/mairimashita-iruma-kun-21473-chuong-105-ac-ma-giao-hoat" title="Mairimashita! Iruma-kun Chương 105: &#193;c ma giảo hoạt" >Mairimashita! Iruma-kun Chương 105: &#193;c ma giảo hoạt</a>
            </span>
            <span class="publishedDate">11/03/2020 22:22</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-430986">
            <span class="title">
                <a id="c_430986" href="/c430986/mairimashita-iruma-kun-21473-chuong-104-toan-bo-deu-la-ke-manh" title="Mairimashita! Iruma-kun Chương 104: To&#224;n bộ đều l&#224; kẻ mạnh" >Mairimashita! Iruma-kun Chương 104: To&#224;n bộ đều l&#224; kẻ mạnh</a>
            </span>
            <span class="publishedDate">09/03/2020 22:21</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-430281">
            <span class="title">
                <a id="c_430281" href="/c430281/mairimashita-iruma-kun-21473-chuong-103-anh-lua-hieu-cho-le-thu-hoach" title="Mairimashita! Iruma-kun Chương 103: &#193;nh lửa hiệu cho lễ thu hoạch" >Mairimashita! Iruma-kun Chương 103: &#193;nh lửa hiệu cho lễ thu hoạch</a>
            </span>
            <span class="publishedDate">07/03/2020 15:26</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-429547">
            <span class="title">
                <a id="c_429547" href="/c429547/mairimashita-iruma-kun-21473-chuong-102-before-after" title="Mairimashita! Iruma-kun Chương 102: Before➡After" >Mairimashita! Iruma-kun Chương 102: Before➡After</a>
            </span>
            <span class="publishedDate">03/03/2020 23:40</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-429041">
            <span class="title">
                <a id="c_429041" href="/c429041/mairimashita-iruma-kun-21473-chuong-101-nhung-hoc-tro-tuyet-voi" title="Mairimashita! Iruma-kun Chương 101: Những học tr&#242; tuyệt vời" >Mairimashita! Iruma-kun Chương 101: Những học tr&#242; tuyệt vời</a>
            </span>
            <span class="publishedDate">01/03/2020 23:08</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-427854">
            <span class="title">
                <a id="c_427854" href="/c427854/mairimashita-iruma-kun-21473-chuong-100-y-nguyen-that-su-cua-iruma" title="Mairimashita! Iruma-kun Chương 100: &#221; nguyện thật sự của Iruma" >Mairimashita! Iruma-kun Chương 100: &#221; nguyện thật sự của Iruma</a>
            </span>
            <span class="publishedDate">25/02/2020 21:43</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-426247">
            <span class="title">
                <a id="c_426247" href="/c426247/mairimashita-iruma-kun-21473-chuong-99-vu-khi-khong-danh-cho-ac-ma" title="Mairimashita! Iruma-kun Chương 99: Vũ kh&#237; kh&#244;ng d&#224;nh cho &#225;c ma" >Mairimashita! Iruma-kun Chương 99: Vũ kh&#237; kh&#244;ng d&#224;nh cho &#225;c ma</a>
            </span>
            <span class="publishedDate">18/02/2020 22:35</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374439">
            <span class="title">
                <a id="c_374439" href="/c374439/mairimashita-iruma-kun-21473-chuong-995-legend-interview-mairimashita-iruma-kun-nishi-osamu-sensei" title="Mairimashita! Iruma-kun Chương 99.5: Legend Interview!! &quot;Mairimashita! Iruma-kun&quot; - Nishi Osamu-sensei" >Mairimashita! Iruma-kun Chương 99.5: Legend Interview!! &quot;Mairimashita! Iruma-kun&quot; - Nishi Osamu-sensei</a>
            </span>
            <span class="publishedDate">29/06/2019 03:40</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-424506">
            <span class="title">
                <a id="c_424506" href="/c424506/mairimashita-iruma-kun-21473-chuong-98-nhung-cau-chuyen-kinh-khung" title="Mairimashita! Iruma-kun Chương 98: Những c&#226;u chuyện kinh khủng" >Mairimashita! Iruma-kun Chương 98: Những c&#226;u chuyện kinh khủng</a>
            </span>
            <span class="publishedDate">12/02/2020 21:49</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-424118">
            <span class="title">
                <a id="c_424118" href="/c424118/mairimashita-iruma-kun-21473-chuong-97-bachiko" title="Mairimashita! Iruma-kun Chương 97: Bachiko" >Mairimashita! Iruma-kun Chương 97: Bachiko</a>
            </span>
            <span class="publishedDate">10/02/2020 13:15</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-423260">
            <span class="title">
                <a id="c_423260" href="/c423260/mairimashita-iruma-kun-21473-chuong-96-ke-hoach-cua-doi-ngu-giao-vien" title="Mairimashita! Iruma-kun Chương 96: Kế hoạch của đội ngũ gi&#225;o vi&#234;n" >Mairimashita! Iruma-kun Chương 96: Kế hoạch của đội ngũ gi&#225;o vi&#234;n</a>
            </span>
            <span class="publishedDate">05/02/2020 23:08</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-422134">
            <span class="title">
                <a id="c_422134" href="/c422134/mairimashita-iruma-kun-21473-chuong-95-hoc-ky-moi-cua-lop-ca-biet" title="Mairimashita! Iruma-kun Chương 95: Học kỳ mới của Lớp C&#225; Biệt" >Mairimashita! Iruma-kun Chương 95: Học kỳ mới của Lớp C&#225; Biệt</a>
            </span>
            <span class="publishedDate">01/02/2020 13:55</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-419870">
            <span class="title">
                <a id="c_419870" href="/c419870/mairimashita-iruma-kun-21473-chuong-94-buoi-hen-ho-nhu-mo" title="Mairimashita! Iruma-kun Chương 94: Buổi hẹn h&#242; như mơ" >Mairimashita! Iruma-kun Chương 94: Buổi hẹn h&#242; như mơ</a>
            </span>
            <span class="publishedDate">19/01/2020 00:40</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-418456">
            <span class="title">
                <a id="c_418456" href="/c418456/mairimashita-iruma-kun-21473-chuong-93-ke-thong-tri-ma-gioi" title="Mairimashita! Iruma-kun Chương 93: Kẻ thống trị Ma Giới" >Mairimashita! Iruma-kun Chương 93: Kẻ thống trị Ma Giới</a>
            </span>
            <span class="publishedDate">11/01/2020 21:11</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-418310">
            <span class="title">
                <a id="c_418310" href="/c418310/mairimashita-iruma-kun-21473-chuong-92-magical-street" title="Mairimashita! Iruma-kun Chương 92: Magical Street" >Mairimashita! Iruma-kun Chương 92: Magical Street</a>
            </span>
            <span class="publishedDate">10/01/2020 23:19</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-417926">
            <span class="title">
                <a id="c_417926" href="/c417926/mairimashita-iruma-kun-21473-chuong-91-le-nghi-cua-ac-ma" title="Mairimashita! Iruma-kun Chương 91: Lễ nghi của &#193;c Ma" >Mairimashita! Iruma-kun Chương 91: Lễ nghi của &#193;c Ma</a>
            </span>
            <span class="publishedDate">08/01/2020 20:46</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-415404">
            <span class="title">
                <a id="c_415404" href="/c415404/mairimashita-iruma-kun-21473-chuong-90-sabbath" title="Mairimashita! Iruma-kun Chương 90: Sabbath" >Mairimashita! Iruma-kun Chương 90: Sabbath</a>
            </span>
            <span class="publishedDate">27/12/2019 18:30</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-413585">
            <span class="title">
                <a id="c_413585" href="/c413585/mairimashita-iruma-kun-21473-chuong-89-nha-cua-clara" title="Mairimashita! Iruma-kun Chương 89: Nh&#224; của Clara" >Mairimashita! Iruma-kun Chương 89: Nh&#224; của Clara</a>
            </span>
            <span class="publishedDate">18/12/2019 22:58</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-412891">
            <span class="title">
                <a id="c_412891" href="/c412891/mairimashita-iruma-kun-21473-chuong-88-lap-lanh-ruc-ro" title="Mairimashita! Iruma-kun Chương 88: Lấp l&#225;nh rực rỡ" >Mairimashita! Iruma-kun Chương 88: Lấp l&#225;nh rực rỡ</a>
            </span>
            <span class="publishedDate">14/12/2019 22:07</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-432208">
            <span class="title">
                <a id="c_432208" href="/c432208/mairimashita-iruma-kun-21473-chuong-885-omake-volume-10" title="Mairimashita! Iruma-kun Chương 88.5: Omake Volume 10" >Mairimashita! Iruma-kun Chương 88.5: Omake Volume 10</a>
            </span>
            <span class="publishedDate">14/03/2020 00:52</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-412500">
            <span class="title">
                <a id="c_412500" href="/c412500/mairimashita-iruma-kun-21473-chuong-87-ke-thu-dinh-menh" title="Mairimashita! Iruma-kun Chương 87: Kẻ th&#249; định mệnh" >Mairimashita! Iruma-kun Chương 87: Kẻ th&#249; định mệnh</a>
            </span>
            <span class="publishedDate">12/12/2019 19:03</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-411173">
            <span class="title">
                <a id="c_411173" href="/c411173/mairimashita-iruma-kun-21473-chuong-86-duc-vong-cua-toi" title="Mairimashita! Iruma-kun Chương 86: Dục vọng của t&#244;i" >Mairimashita! Iruma-kun Chương 86: Dục vọng của t&#244;i</a>
            </span>
            <span class="publishedDate">06/12/2019 09:16</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-411010">
            <span class="title">
                <a id="c_411010" href="/c411010/mairimashita-iruma-kun-21473-chuong-85-man-vung-vay-cuoi-cung" title="Mairimashita! Iruma-kun Chương 85: M&#224;n v&#249;ng vẫy cuối c&#249;ng" >Mairimashita! Iruma-kun Chương 85: M&#224;n v&#249;ng vẫy cuối c&#249;ng</a>
            </span>
            <span class="publishedDate">05/12/2019 10:49</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-410855">
            <span class="title">
                <a id="c_410855" href="/c410855/mairimashita-iruma-kun-21473-chuong-84-gargoyle-nhe-nanh" title="Mairimashita! Iruma-kun Chương 84: Gargoyle nhe nanh" >Mairimashita! Iruma-kun Chương 84: Gargoyle nhe nanh</a>
            </span>
            <span class="publishedDate">04/12/2019 11:06</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-410010">
            <span class="title">
                <a id="c_410010" href="/c410010/mairimashita-iruma-kun-21473-chuong-83-cay-thuong-manh-nhat" title="Mairimashita! Iruma-kun Chương 83: C&#226;y thương mạnh nhất" >Mairimashita! Iruma-kun Chương 83: C&#226;y thương mạnh nhất</a>
            </span>
            <span class="publishedDate">29/11/2019 22:56</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-409655">
            <span class="title">
                <a id="c_409655" href="/c409655/mairimashita-iruma-kun-21473-chuong-82-hai-nguoi-canh-tranh" title="Mairimashita! Iruma-kun Chương 82: Hai người cạnh tranh" >Mairimashita! Iruma-kun Chương 82: Hai người cạnh tranh</a>
            </span>
            <span class="publishedDate">28/11/2019 09:21</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-409305">
            <span class="title">
                <a id="c_409305" href="/c409305/mairimashita-iruma-kun-21473-chuong-81-thieu-nu-vo-dich-cuc-manh" title="Mairimashita! Iruma-kun Chương 81: Thiếu nữ v&#244; địch cực mạnh" >Mairimashita! Iruma-kun Chương 81: Thiếu nữ v&#244; địch cực mạnh</a>
            </span>
            <span class="publishedDate">26/11/2019 23:33</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-408589">
            <span class="title">
                <a id="c_408589" href="/c408589/mairimashita-iruma-kun-21473-chuong-80-ben-nao-manh-hon" title="Mairimashita! Iruma-kun Chương 80: B&#234;n n&#224;o mạnh hơn?" >Mairimashita! Iruma-kun Chương 80: B&#234;n n&#224;o mạnh hơn?</a>
            </span>
            <span class="publishedDate">22/11/2019 23:44</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-407323">
            <span class="title">
                <a id="c_407323" href="/c407323/mairimashita-iruma-kun-21473-chuong-79-am-thanh-ren-vang-keu-goi-thang-loi" title="Mairimashita! Iruma-kun Chương 79: &#194;m thanh rền vang k&#234;u gọi thắng lợi	" >Mairimashita! Iruma-kun Chương 79: &#194;m thanh rền vang k&#234;u gọi thắng lợi	</a>
            </span>
            <span class="publishedDate">16/11/2019 11:23</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-407534">
            <span class="title">
                <a id="c_407534" href="/c407534/mairimashita-iruma-kun-21473-chuong-795-omake-volume-9" title="Mairimashita! Iruma-kun Chương 79.5: Omake Volume 9" >Mairimashita! Iruma-kun Chương 79.5: Omake Volume 9</a>
            </span>
            <span class="publishedDate">17/11/2019 12:00</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-406479">
            <span class="title">
                <a id="c_406479" href="/c406479/mairimashita-iruma-kun-21473-chuong-78-niem-tu-hao-nhu-mot-dai-ca" title="Mairimashita! Iruma-kun Chương 78: Niềm tự h&#224;o như một đại ca" >Mairimashita! Iruma-kun Chương 78: Niềm tự h&#224;o như một đại ca</a>
            </span>
            <span class="publishedDate">12/11/2019 11:42</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-405555">
            <span class="title">
                <a id="c_405555" href="/c405555/mairimashita-iruma-kun-21473-chuong-77-ten-goi-cua-cam-giac-nay-la" title="Mairimashita! Iruma-kun Chương 77: T&#234;n gọi của cảm gi&#225;c n&#224;y l&#224;" >Mairimashita! Iruma-kun Chương 77: T&#234;n gọi của cảm gi&#225;c n&#224;y l&#224;</a>
            </span>
            <span class="publishedDate">08/11/2019 01:17</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-405435">
            <span class="title">
                <a id="c_405435" href="/c405435/mairimashita-iruma-kun-21473-chuong-76-tam-lung-co-the-dua-vao" title="Mairimashita! Iruma-kun Chương 76: Tấm lưng c&#243; thể dựa v&#224;o" >Mairimashita! Iruma-kun Chương 76: Tấm lưng c&#243; thể dựa v&#224;o</a>
            </span>
            <span class="publishedDate">07/11/2019 00:36</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-405024">
            <span class="title">
                <a id="c_405024" href="/c405024/mairimashita-iruma-kun-21473-chuong-75-ma-thu-tap-kich" title="Mairimashita! Iruma-kun Chương 75: Ma th&#250; tập k&#237;ch" >Mairimashita! Iruma-kun Chương 75: Ma th&#250; tập k&#237;ch</a>
            </span>
            <span class="publishedDate">05/11/2019 02:56</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-404279">
            <span class="title">
                <a id="c_404279" href="/c404279/mairimashita-iruma-kun-21473-chuong-74-ke-hoach-cua-luc-chi-chung" title="Mairimashita! Iruma-kun Chương 74: Kế hoạch của Lục Chỉ Ch&#250;ng" >Mairimashita! Iruma-kun Chương 74: Kế hoạch của Lục Chỉ Ch&#250;ng</a>
            </span>
            <span class="publishedDate">02/11/2019 02:22</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-404056">
            <span class="title">
                <a id="c_404056" href="/c404056/mairimashita-iruma-kun-21473-chuong-73-nha-tu-ouraboras" title="Mairimashita! Iruma-kun Chương 73: Nh&#224; t&#249; Ouraboras" >Mairimashita! Iruma-kun Chương 73: Nh&#224; t&#249; Ouraboras</a>
            </span>
            <span class="publishedDate">01/11/2019 02:23</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-403817">
            <span class="title">
                <a id="c_403817" href="/c403817/mairimashita-iruma-kun-21473-chuong-72-anh-mat-sac-ben" title="Mairimashita! Iruma-kun Chương 72: &#193;nh mắt sắc b&#233;n" >Mairimashita! Iruma-kun Chương 72: &#193;nh mắt sắc b&#233;n</a>
            </span>
            <span class="publishedDate">30/10/2019 18:40</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-402765">
            <span class="title">
                <a id="c_402765" href="/c402765/mairimashita-iruma-kun-21473-chuong-71-muc-tieu-vui-choi-cua-moi-nguoi" title="Mairimashita! Iruma-kun Chương 71: Mục ti&#234;u vui chơi của mọi người" >Mairimashita! Iruma-kun Chương 71: Mục ti&#234;u vui chơi của mọi người</a>
            </span>
            <span class="publishedDate">25/10/2019 17:57</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-402513">
            <span class="title">
                <a id="c_402513" href="/c402513/mairimashita-iruma-kun-21473-chuong-70-walter-park" title="Mairimashita! Iruma-kun Chương 70: Walter Park" >Mairimashita! Iruma-kun Chương 70: Walter Park</a>
            </span>
            <span class="publishedDate">23/10/2019 18:18</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-401156">
            <span class="title">
                <a id="c_401156" href="/c401156/mairimashita-iruma-kun-21473-chuong-69-cach-trai-qua-ngay-tan-cung" title="Mairimashita! Iruma-kun Chương 69: C&#225;ch trải qua Ng&#224;y Tận C&#249;ng" >Mairimashita! Iruma-kun Chương 69: C&#225;ch trải qua Ng&#224;y Tận C&#249;ng</a>
            </span>
            <span class="publishedDate">15/10/2019 23:25</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-400283">
            <span class="title">
                <a id="c_400283" href="/c400283/mairimashita-iruma-kun-21473-chuong-68-chuyen-ghe-tham-nha-hoc-sinh-cua-kalego" title="Mairimashita! Iruma-kun Chương 68: Chuyến gh&#233; thăm nh&#224; học sinh của Kalego" >Mairimashita! Iruma-kun Chương 68: Chuyến gh&#233; thăm nh&#224; học sinh của Kalego</a>
            </span>
            <span class="publishedDate">11/10/2019 00:22</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-398482">
            <span class="title">
                <a id="c_398482" href="/c398482/mairimashita-iruma-kun-21473-chuong-67-girl-s-talk" title="Mairimashita! Iruma-kun Chương 67: Girl&#39;s Talk" >Mairimashita! Iruma-kun Chương 67: Girl&#39;s Talk</a>
            </span>
            <span class="publishedDate">02/10/2019 23:05</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-397284">
            <span class="title">
                <a id="c_397284" href="/c397284/mairimashita-iruma-kun-21473-chuong-66-ki-thi-tan-cung" title="Mairimashita! Iruma-kun Chương 66: K&#236; thi tận c&#249;ng" >Mairimashita! Iruma-kun Chương 66: K&#236; thi tận c&#249;ng</a>
            </span>
            <span class="publishedDate">28/09/2019 22:48</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-394660">
            <span class="title">
                <a id="c_394660" href="/c394660/mairimashita-iruma-kun-21473-chuong-65-niem-vui-khi-hoc-tap" title="Mairimashita! Iruma-kun Chương 65: Niềm vui khi học tập" >Mairimashita! Iruma-kun Chương 65: Niềm vui khi học tập</a>
            </span>
            <span class="publishedDate">17/09/2019 10:25</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-393967">
            <span class="title">
                <a id="c_393967" href="/c393967/mairimashita-iruma-kun-21473-chuong-64-su-that-gay-chan-dong" title="Mairimashita! Iruma-kun Chương 64: Sự thật g&#226;y chấn động" >Mairimashita! Iruma-kun Chương 64: Sự thật g&#226;y chấn động</a>
            </span>
            <span class="publishedDate">14/09/2019 21:03</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-393405">
            <span class="title">
                <a id="c_393405" href="/c393405/mairimashita-iruma-kun-21473-chuong-63-gio-hoc-cua-balam" title="Mairimashita! Iruma-kun Chương 63: Giờ học của Balam" >Mairimashita! Iruma-kun Chương 63: Giờ học của Balam</a>
            </span>
            <span class="publishedDate">11/09/2019 20:18</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-392055">
            <span class="title">
                <a id="c_392055" href="/c392055/mairimashita-iruma-kun-21473-chuong-62-viec-hoc-tap-o-ma-gioi" title="Mairimashita! Iruma-kun Chương 62: Việc học t&#226;p ở Ma Giới" >Mairimashita! Iruma-kun Chương 62: Việc học t&#226;p ở Ma Giới</a>
            </span>
            <span class="publishedDate">06/09/2019 23:34</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-389930">
            <span class="title">
                <a id="c_389930" href="/c389930/mairimashita-iruma-kun-21473-chuong-61-mot-tuong-lai-day-hua-hen" title="Mairimashita! Iruma-kun Chương 61: Một tương lai đầy hứa hẹn" >Mairimashita! Iruma-kun Chương 61: Một tương lai đầy hứa hẹn</a>
            </span>
            <span class="publishedDate">31/08/2019 02:37</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-391016">
            <span class="title">
                <a id="c_391016" href="/c391016/mairimashita-iruma-kun-21473-chuong-615-4-koma-volume-7" title="Mairimashita! Iruma-kun Chương 61.5: 4-koma Volume 7" >Mairimashita! Iruma-kun Chương 61.5: 4-koma Volume 7</a>
            </span>
            <span class="publishedDate">03/09/2019 04:15</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-389265">
            <span class="title">
                <a id="c_389265" href="/c389265/mairimashita-iruma-kun-21473-chuong-60-di-vat-cua-dercila" title="Mairimashita! Iruma-kun Chương 60: Di vật của Dercila" >Mairimashita! Iruma-kun Chương 60: Di vật của Dercila</a>
            </span>
            <span class="publishedDate">27/08/2019 23:48</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-387396">
            <span class="title">
                <a id="c_387396" href="/c387396/mairimashita-iruma-kun-21473-chuong-59-ki-tich-cua-lu-he" title="Mairimashita! Iruma-kun Chương 59: K&#236; t&#237;ch của lũ hề" >Mairimashita! Iruma-kun Chương 59: K&#236; t&#237;ch của lũ hề</a>
            </span>
            <span class="publishedDate">23/08/2019 00:42</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-386689">
            <span class="title">
                <a id="c_386689" href="/c386689/mairimashita-iruma-kun-21473-chuong-58-nhung-ac-ma-uu-tu" title="Mairimashita! Iruma-kun Chương 58: Những &#225;c ma ưu t&#250;" >Mairimashita! Iruma-kun Chương 58: Những &#225;c ma ưu t&#250;</a>
            </span>
            <span class="publishedDate">19/08/2019 20:39</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-385576">
            <span class="title">
                <a id="c_385576" href="/c385576/mairimashita-iruma-kun-21473-chuong-57-nhung-giao-vien-cua-babirus" title="Mairimashita! Iruma-kun Chương 57: Những gi&#225;o vi&#234;n của Babirus" >Mairimashita! Iruma-kun Chương 57: Những gi&#225;o vi&#234;n của Babirus</a>
            </span>
            <span class="publishedDate">14/08/2019 01:56</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-385143">
            <span class="title">
                <a id="c_385143" href="/c385143/mairimashita-iruma-kun-21473-chuong-56-ban-cung-lop-ca-biet" title="Mairimashita! Iruma-kun Chương 56: Bạn C&#249;ng Lớp C&#225; Biệt" >Mairimashita! Iruma-kun Chương 56: Bạn C&#249;ng Lớp C&#225; Biệt</a>
            </span>
            <span class="publishedDate">12/08/2019 13:00</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-384702">
            <span class="title">
                <a id="c_384702" href="/c384702/mairimashita-iruma-kun-21473-chuong-55-royal-one-lop-hoc-vua" title="Mairimashita! Iruma-kun Chương 55: Royal One - Ph&#242;ng Học Vua" >Mairimashita! Iruma-kun Chương 55: Royal One - Ph&#242;ng Học Vua</a>
            </span>
            <span class="publishedDate">10/08/2019 19:35</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-382556">
            <span class="title">
                <a id="c_382556" href="/c382556/mairimashita-iruma-kun-21473-chuong-54-mot-iruma-hoan-toan-trai-nguoc" title="Mairimashita! Iruma-kun Chương 54: Một Iruma ho&#224;n to&#224;n tr&#225;i ngược" >Mairimashita! Iruma-kun Chương 54: Một Iruma ho&#224;n to&#224;n tr&#225;i ngược</a>
            </span>
            <span class="publishedDate">01/08/2019 18:00</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-380242">
            <span class="title">
                <a id="c_380242" href="/c380242/mairimashita-iruma-kun-21473-chuong-53-tham-vong-moi" title="Mairimashita! Iruma-kun Chương 53: Tham vọng mới" >Mairimashita! Iruma-kun Chương 53: Tham vọng mới</a>
            </span>
            <span class="publishedDate">22/07/2019 22:21</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-378957">
            <span class="title">
                <a id="c_378957" href="/c378957/mairimashita-iruma-kun-21473-chuong-52-tam-nhin-cua-hoi-truong-hoc-sinh" title="Mairimashita! Iruma-kun Chương 52: Tầm nh&#236;n của Hội Trưởng Học Sinh" >Mairimashita! Iruma-kun Chương 52: Tầm nh&#236;n của Hội Trưởng Học Sinh</a>
            </span>
            <span class="publishedDate">16/07/2019 23:52</span>
            <span class="download">
                    <a href="https://drive.google.com/open?id=1gFpD_BCYHiOxjIHvunn597V1UPeg7c8Q" rel="nofollow" title="Download">Download</a>
            </span>
        </p>
        <p id="chapter-375249">
            <span class="title">
                <a id="c_375249" href="/c375249/mairimashita-iruma-kun-21473-chuong-51-tinh-cam-ngap-tran" title="Mairimashita! Iruma-kun Chương 51: T&#236;nh cảm ngập tr&#224;n" >Mairimashita! Iruma-kun Chương 51: T&#236;nh cảm ngập tr&#224;n</a>
            </span>
            <span class="publishedDate">02/07/2019 04:24</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374486">
            <span class="title">
                <a id="c_374486" href="/c374486/mairimashita-iruma-kun-21473-chuong-50-su-quyen-ru-cua-ronove" title="Mairimashita! Iruma-kun Chương 50: Sự quyến rũ của Ronove" >Mairimashita! Iruma-kun Chương 50: Sự quyến rũ của Ronove</a>
            </span>
            <span class="publishedDate">29/06/2019 04:02</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374485">
            <span class="title">
                <a id="c_374485" href="/c374485/mairimashita-iruma-kun-21473-chuong-49-ac-ma-thieu-nu" title="Mairimashita! Iruma-kun Chương 49: &#193;c ma thiếu nữ" >Mairimashita! Iruma-kun Chương 49: &#193;c ma thiếu nữ</a>
            </span>
            <span class="publishedDate">29/06/2019 04:02</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374484">
            <span class="title">
                <a id="c_374484" href="/c374484/mairimashita-iruma-kun-21473-chuong-48-nu-kiet-sup-do" title="Mairimashita! Iruma-kun Chương 48: Nữ kiệt sụp đổ" >Mairimashita! Iruma-kun Chương 48: Nữ kiệt sụp đổ</a>
            </span>
            <span class="publishedDate">29/06/2019 04:02</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374483">
            <span class="title">
                <a id="c_374483" href="/c374483/mairimashita-iruma-kun-21473-chuong-47-hoi-hoc-sinh-tan-bao" title="Mairimashita! Iruma-kun Chương 47: Hội Học Sinh t&#224;n bạo" >Mairimashita! Iruma-kun Chương 47: Hội Học Sinh t&#224;n bạo</a>
            </span>
            <span class="publishedDate">29/06/2019 04:02</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374482">
            <span class="title">
                <a id="c_374482" href="/c374482/mairimashita-iruma-kun-21473-chuong-46-quyet-dinh-cua-amelie" title="Mairimashita! Iruma-kun Chương 46: Quyết định của Amelie" >Mairimashita! Iruma-kun Chương 46: Quyết định của Amelie</a>
            </span>
            <span class="publishedDate">29/06/2019 04:01</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374480">
            <span class="title">
                <a id="c_374480" href="/c374480/mairimashita-iruma-kun-21473-chuong-45-bi-mat-cua-chiec-nhan" title="Mairimashita! Iruma-kun Chương 45: B&#237; mật của chiếc nhẫn" >Mairimashita! Iruma-kun Chương 45: B&#237; mật của chiếc nhẫn</a>
            </span>
            <span class="publishedDate">29/06/2019 04:01</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374479">
            <span class="title">
                <a id="c_374479" href="/c374479/mairimashita-iruma-kun-21473-chuong-44-cach-su-dung-ma-thuat" title="Mairimashita! Iruma-kun Chương 44: C&#225;ch sử dụng ma thuật" >Mairimashita! Iruma-kun Chương 44: C&#225;ch sử dụng ma thuật</a>
            </span>
            <span class="publishedDate">29/06/2019 04:01</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374478">
            <span class="title">
                <a id="c_374478" href="/c374478/mairimashita-iruma-kun-21473-chuong-43-vi-ai-do" title="Mairimashita! Iruma-kun Chương 43: V&#236; ai đ&#243;" >Mairimashita! Iruma-kun Chương 43: V&#236; ai đ&#243;</a>
            </span>
            <span class="publishedDate">29/06/2019 04:01</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374477">
            <span class="title">
                <a id="c_374477" href="/c374477/mairimashita-iruma-kun-21473-chuong-42-man-xung-kich-day-lap-lanh" title="Mairimashita! Iruma-kun Chương 42: M&#224;n xung k&#237;ch đầy lấp l&#225;nh" >Mairimashita! Iruma-kun Chương 42: M&#224;n xung k&#237;ch đầy lấp l&#225;nh</a>
            </span>
            <span class="publishedDate">29/06/2019 04:00</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374476">
            <span class="title">
                <a id="c_374476" href="/c374476/mairimashita-iruma-kun-21473-chuong-41-bat-can-khong-nhan-ra" title="Mairimashita! Iruma-kun Chương 41: Bất cẩn... kh&#244;ng nhận ra" >Mairimashita! Iruma-kun Chương 41: Bất cẩn... kh&#244;ng nhận ra</a>
            </span>
            <span class="publishedDate">29/06/2019 04:00</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374475">
            <span class="title">
                <a id="c_374475" href="/c374475/mairimashita-iruma-kun-21473-chuong-40-akudol-kuromu-chan" title="Mairimashita! Iruma-kun Chương 40: Akudol Kuromu-chan" >Mairimashita! Iruma-kun Chương 40: Akudol Kuromu-chan</a>
            </span>
            <span class="publishedDate">29/06/2019 03:59</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374474">
            <span class="title">
                <a id="c_374474" href="/c374474/mairimashita-iruma-kun-21473-chuong-39-cuoc-chien-nau-an-chan-thanh" title="Mairimashita! Iruma-kun Chương 39: Cuộc chiến nấu ăn ch&#226;n th&#224;nh" >Mairimashita! Iruma-kun Chương 39: Cuộc chiến nấu ăn ch&#226;n th&#224;nh</a>
            </span>
            <span class="publishedDate">29/06/2019 03:59</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374473">
            <span class="title">
                <a id="c_374473" href="/c374473/mairimashita-iruma-kun-21473-chuong-38-dai-ngo-cua-loai-nguoi" title="Mairimashita! Iruma-kun Chương 38: Đ&#227;i ngộ của lo&#224;i người" >Mairimashita! Iruma-kun Chương 38: Đ&#227;i ngộ của lo&#224;i người</a>
            </span>
            <span class="publishedDate">29/06/2019 03:59</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374472">
            <span class="title">
                <a id="c_374472" href="/c374472/mairimashita-iruma-kun-21473-chuong-37-bieu-duong-day-vinh-quang" title="Mairimashita! Iruma-kun Chương 37: Biểu dương đầy vinh quang" >Mairimashita! Iruma-kun Chương 37: Biểu dương đầy vinh quang</a>
            </span>
            <span class="publishedDate">29/06/2019 03:58</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374469">
            <span class="title">
                <a id="c_374469" href="/c374469/mairimashita-iruma-kun-21473-chuong-36-thoi-gian-cung-voi-gia-dinh" title="Mairimashita! Iruma-kun Chương 36: Thời gian c&#249;ng với gia đ&#236;nh" >Mairimashita! Iruma-kun Chương 36: Thời gian c&#249;ng với gia đ&#236;nh</a>
            </span>
            <span class="publishedDate">29/06/2019 03:58</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374467">
            <span class="title">
                <a id="c_374467" href="/c374467/mairimashita-iruma-kun-21473-chuong-35-toi-se-khong-tu-bo-bat-ky-thu-gi" title="Mairimashita! Iruma-kun Chương 35: T&#244;i sẽ kh&#244;ng từ bỏ bất kỳ thứ g&#236;" >Mairimashita! Iruma-kun Chương 35: T&#244;i sẽ kh&#244;ng từ bỏ bất kỳ thứ g&#236;</a>
            </span>
            <span class="publishedDate">29/06/2019 03:58</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374465">
            <span class="title">
                <a id="c_374465" href="/c374465/mairimashita-iruma-kun-21473-chuong-34-bung-phat-ma-luc" title="Mairimashita! Iruma-kun Chương 34: B&#249;ng ph&#225;t ma lực" >Mairimashita! Iruma-kun Chương 34: B&#249;ng ph&#225;t ma lực</a>
            </span>
            <span class="publishedDate">29/06/2019 03:58</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374464">
            <span class="title">
                <a id="c_374464" href="/c374464/mairimashita-iruma-kun-21473-chuong-33-bieu-cam-tuyet-vong" title="Mairimashita! Iruma-kun Chương 33: Biểu cảm tuyệt vọng" >Mairimashita! Iruma-kun Chương 33: Biểu cảm tuyệt vọng</a>
            </span>
            <span class="publishedDate">29/06/2019 03:57</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374463">
            <span class="title">
                <a id="c_374463" href="/c374463/mairimashita-iruma-kun-21473-chuong-32-thu-khat-vong-tu-trong-tim" title="Mairimashita! Iruma-kun Chương 32: Thứ kh&#225;t vọng từ trong tim" >Mairimashita! Iruma-kun Chương 32: Thứ kh&#225;t vọng từ trong tim</a>
            </span>
            <span class="publishedDate">29/06/2019 03:57</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374462">
            <span class="title">
                <a id="c_374462" href="/c374462/mairimashita-iruma-kun-21473-chuong-31-truong-binh-doi-clara-va-quan-chi-huy-azu" title="Mairimashita! Iruma-kun Chương 31: Trưởng Binh Đội Clara v&#224; Quan Chỉ Huy Azu" >Mairimashita! Iruma-kun Chương 31: Trưởng Binh Đội Clara v&#224; Quan Chỉ Huy Azu</a>
            </span>
            <span class="publishedDate">29/06/2019 03:56</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374461">
            <span class="title">
                <a id="c_374461" href="/c374461/mairimashita-iruma-kun-21473-chuong-30-me-cung-chuot-cua-kirio" title="Mairimashita! Iruma-kun Chương 30: M&#234; cung chuột của Kirio" >Mairimashita! Iruma-kun Chương 30: M&#234; cung chuột của Kirio</a>
            </span>
            <span class="publishedDate">29/06/2019 03:56</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374459">
            <span class="title">
                <a id="c_374459" href="/c374459/mairimashita-iruma-kun-21473-chuong-29-da-tam-tich-luy" title="Mairimashita! Iruma-kun Chương 29: D&#227; t&#226;m t&#237;ch lũy" >Mairimashita! Iruma-kun Chương 29: D&#227; t&#226;m t&#237;ch lũy</a>
            </span>
            <span class="publishedDate">29/06/2019 03:55</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374458">
            <span class="title">
                <a id="c_374458" href="/c374458/mairimashita-iruma-kun-21473-chuong-28-bat-dau-dem-truoc-le-hoi" title="Mairimashita! Iruma-kun Chương 28: Bắt đầu đ&#234;m trước lễ hội" >Mairimashita! Iruma-kun Chương 28: Bắt đầu đ&#234;m trước lễ hội</a>
            </span>
            <span class="publishedDate">29/06/2019 03:55</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374457">
            <span class="title">
                <a id="c_374457" href="/c374457/mairimashita-iruma-kun-21473-chuong-27-nhung-nguoi-giong-nhau" title="Mairimashita! Iruma-kun Chương 27: Những người giống nhau" >Mairimashita! Iruma-kun Chương 27: Những người giống nhau</a>
            </span>
            <span class="publishedDate">29/06/2019 03:55</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374456">
            <span class="title">
                <a id="c_374456" href="/c374456/mairimashita-iruma-kun-21473-chuong-26-mat-that-cua-kirio" title="Mairimashita! Iruma-kun Chương 26: Mật thất của Kirio" >Mairimashita! Iruma-kun Chương 26: Mật thất của Kirio</a>
            </span>
            <span class="publishedDate">29/06/2019 03:54</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374455">
            <span class="title">
                <a id="c_374455" href="/c374455/mairimashita-iruma-kun-21473-chuong-25-nhung-nguoi-chuan-bi" title="Mairimashita! Iruma-kun Chương 25: Những người chuẩn bị" >Mairimashita! Iruma-kun Chương 25: Những người chuẩn bị</a>
            </span>
            <span class="publishedDate">29/06/2019 03:54</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374454">
            <span class="title">
                <a id="c_374454" href="/c374454/mairimashita-iruma-kun-21473-chuong-24-su-doan-trinh-dien-lan-dau" title="Mairimashita! Iruma-kun Chương 24: Sư Đo&#224;n Tr&#236;nh Diễn Lần Đầu" >Mairimashita! Iruma-kun Chương 24: Sư Đo&#224;n Tr&#236;nh Diễn Lần Đầu</a>
            </span>
            <span class="publishedDate">29/06/2019 03:54</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374453">
            <span class="title">
                <a id="c_374453" href="/c374453/mairimashita-iruma-kun-21473-chuong-23-hoi-nghi-thap-tam-quan-thirteen-dinner" title="Mairimashita! Iruma-kun Chương 23: Hội Nghị Thập Tam Quan - Thirteen Dinner" >Mairimashita! Iruma-kun Chương 23: Hội Nghị Thập Tam Quan - Thirteen Dinner</a>
            </span>
            <span class="publishedDate">29/06/2019 03:53</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374452">
            <span class="title">
                <a id="c_374452" href="/c374452/mairimashita-iruma-kun-21473-chuong-22-cung-voi-su-ma-nao" title="Mairimashita! Iruma-kun Chương 22: C&#249;ng với Sử Ma n&#224;o" >Mairimashita! Iruma-kun Chương 22: C&#249;ng với Sử Ma n&#224;o</a>
            </span>
            <span class="publishedDate">29/06/2019 03:53</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374451">
            <span class="title">
                <a id="c_374451" href="/c374451/mairimashita-iruma-kun-21473-chuong-21-su-doan-nghien-cuu-ma-cu" title="Mairimashita! Iruma-kun Chương 21: Sư Đo&#224;n Nghi&#234;n Cứu Ma Cụ" >Mairimashita! Iruma-kun Chương 21: Sư Đo&#224;n Nghi&#234;n Cứu Ma Cụ</a>
            </span>
            <span class="publishedDate">29/06/2019 03:53</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374441">
            <span class="title">
                <a id="c_374441" href="/c374441/mairimashita-iruma-kun-21473-chuong-20-ac-ma-khong-co-ma-luc" title="Mairimashita! Iruma-kun Chương 20: &#193;c Ma kh&#244;ng c&#243; ma lực" >Mairimashita! Iruma-kun Chương 20: &#193;c Ma kh&#244;ng c&#243; ma lực</a>
            </span>
            <span class="publishedDate">29/06/2019 03:41</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374440">
            <span class="title">
                <a id="c_374440" href="/c374440/mairimashita-iruma-kun-21473-chuong-19-cuoc-chien-tranh-gianh-hoc-vien-nam-nhat" title="Mairimashita! Iruma-kun Chương 19: Cuộc chiến tranh gi&#224;nh học vi&#234;n năm nhất" >Mairimashita! Iruma-kun Chương 19: Cuộc chiến tranh gi&#224;nh học vi&#234;n năm nhất</a>
            </span>
            <span class="publishedDate">29/06/2019 03:41</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374438">
            <span class="title">
                <a id="c_374438" href="/c374438/mairimashita-iruma-kun-21473-chuong-18-thach-thuc-cua-su-doan" title="Mairimashita! Iruma-kun Chương 18: Th&#225;ch thức của Sư Đo&#224;n" >Mairimashita! Iruma-kun Chương 18: Th&#225;ch thức của Sư Đo&#224;n</a>
            </span>
            <span class="publishedDate">29/06/2019 03:39</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374437">
            <span class="title">
                <a id="c_374437" href="/c374437/mairimashita-iruma-kun-21473-chuong-17-clara-nong-bong" title="Mairimashita! Iruma-kun Chương 17: Clara n&#243;ng bỏng" >Mairimashita! Iruma-kun Chương 17: Clara n&#243;ng bỏng</a>
            </span>
            <span class="publishedDate">29/06/2019 03:38</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374435">
            <span class="title">
                <a id="c_374435" href="/c374435/mairimashita-iruma-kun-21473-chuong-16-mot-buoc-tien" title="Mairimashita! Iruma-kun Chương 16: Một bước tiến" >Mairimashita! Iruma-kun Chương 16: Một bước tiến</a>
            </span>
            <span class="publishedDate">29/06/2019 03:37</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374434">
            <span class="title">
                <a id="c_374434" href="/c374434/mairimashita-iruma-kun-21473-chuong-15-quyet-dau-dan-phao-hanh-quyet" title="Mairimashita! Iruma-kun Chương 15: Quyết đấu Đạn Ph&#225;o H&#224;nh Quyết!!" >Mairimashita! Iruma-kun Chương 15: Quyết đấu Đạn Ph&#225;o H&#224;nh Quyết!!</a>
            </span>
            <span class="publishedDate">29/06/2019 03:36</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374433">
            <span class="title">
                <a id="c_374433" href="/c374433/mairimashita-iruma-kun-21473-chuong-14-phan-chan-no-luc" title="Mairimashita! Iruma-kun Chương 14: Phấn chấn nỗ lực" >Mairimashita! Iruma-kun Chương 14: Phấn chấn nỗ lực</a>
            </span>
            <span class="publishedDate">29/06/2019 03:36</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374432">
            <span class="title">
                <a id="c_374432" href="/c374432/mairimashita-iruma-kun-21473-chuong-13-quyet-tam-cua-iruma" title="Mairimashita! Iruma-kun Chương 13: Quyết t&#226;m của Iruma" >Mairimashita! Iruma-kun Chương 13: Quyết t&#226;m của Iruma</a>
            </span>
            <span class="publishedDate">29/06/2019 03:36</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374431">
            <span class="title">
                <a id="c_374431" href="/c374431/mairimashita-iruma-kun-21473-chuong-12-uoc-mo-cua-iruma" title="Mairimashita! Iruma-kun Chương 12: 「Ước mơ」 của Iruma" >Mairimashita! Iruma-kun Chương 12: 「Ước mơ」 của Iruma</a>
            </span>
            <span class="publishedDate">29/06/2019 03:35</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374430">
            <span class="title">
                <a id="c_374430" href="/c374430/mairimashita-iruma-kun-21473-chuong-11-hatsukoi-memory" title="Mairimashita! Iruma-kun Chương 11: Hatsukoi Memory" >Mairimashita! Iruma-kun Chương 11: Hatsukoi Memory</a>
            </span>
            <span class="publishedDate">29/06/2019 03:35</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374429">
            <span class="title">
                <a id="c_374429" href="/c374429/mairimashita-iruma-kun-21473-chuong-10-gia-thuyet-cua-amelie" title="Mairimashita! Iruma-kun Chương 10: Giả thuyết của Amelie" >Mairimashita! Iruma-kun Chương 10: Giả thuyết của Amelie</a>
            </span>
            <span class="publishedDate">29/06/2019 03:35</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374436">
            <span class="title">
                <a id="c_374436" href="/c374436/mairimashita-iruma-kun-21473-volume-1-4-koma" title="Mairimashita! Iruma-kun Volume 1: 4-koma" >Mairimashita! Iruma-kun Volume 1: 4-koma</a>
            </span>
            <span class="publishedDate">29/06/2019 03:37</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374428">
            <span class="title">
                <a id="c_374428" href="/c374428/mairimashita-iruma-kun-21473-chuong-9-moi-nguoi-den-lop-hoc-ma-thuat" title="Mairimashita! Iruma-kun Chương 9: Mọi người đến lớp học ma thuật!" >Mairimashita! Iruma-kun Chương 9: Mọi người đến lớp học ma thuật!</a>
            </span>
            <span class="publishedDate">29/06/2019 03:34</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374427">
            <span class="title">
                <a id="c_374427" href="/c374427/mairimashita-iruma-kun-21473-chuong-8-chiec-nhan-ac-ma" title="Mairimashita! Iruma-kun Chương 8: Chiếc nhẫn &#193;c Ma" >Mairimashita! Iruma-kun Chương 8: Chiếc nhẫn &#193;c Ma</a>
            </span>
            <span class="publishedDate">29/06/2019 03:34</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374426">
            <span class="title">
                <a id="c_374426" href="/c374426/mairimashita-iruma-kun-21473-chuong-7-ke-nham-vao-vi-tri-ma-vuong" title="Mairimashita! Iruma-kun Chương 7: Kẻ nhắm v&#224;o vị tr&#237; ma vương" >Mairimashita! Iruma-kun Chương 7: Kẻ nhắm v&#224;o vị tr&#237; ma vương</a>
            </span>
            <span class="publishedDate">29/06/2019 03:33</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374425">
            <span class="title">
                <a id="c_374425" href="/c374425/mairimashita-iruma-kun-21473-chuong-6-duong-dua-phi-hanh-bat-dau" title="Mairimashita! Iruma-kun Chương 6: Đường đua phi h&#224;nh bắt đầu!!" >Mairimashita! Iruma-kun Chương 6: Đường đua phi h&#224;nh bắt đầu!!</a>
            </span>
            <span class="publishedDate">29/06/2019 03:33</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374424">
            <span class="title">
                <a id="c_374424" href="/c374424/mairimashita-iruma-kun-21473-chuong-5-lop-ca-biet" title="Mairimashita! Iruma-kun Chương 5: Lớp c&#225; biệt" >Mairimashita! Iruma-kun Chương 5: Lớp c&#225; biệt</a>
            </span>
            <span class="publishedDate">29/06/2019 03:33</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374423">
            <span class="title">
                <a id="c_374423" href="/c374423/mairimashita-iruma-kun-21473-chuong-4-ban-cua-ac-ma" title="Mairimashita! Iruma-kun Chương 4: Bạn của &#193;c Ma" >Mairimashita! Iruma-kun Chương 4: Bạn của &#193;c Ma</a>
            </span>
            <span class="publishedDate">29/06/2019 03:32</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374422">
            <span class="title">
                <a id="c_374422" href="/c374422/mairimashita-iruma-kun-21473-chuong-3-iruma-va-clara" title="Mairimashita! Iruma-kun Chương 3: Iruma v&#224; Clara" >Mairimashita! Iruma-kun Chương 3: Iruma v&#224; Clara</a>
            </span>
            <span class="publishedDate">29/06/2019 03:32</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374421">
            <span class="title">
                <a id="c_374421" href="/c374421/mairimashita-iruma-kun-21473-chuong-2-trieu-hoi-ma-thu" title="Mairimashita! Iruma-kun Chương 2: Triệu Hồi Ma Th&#250;" >Mairimashita! Iruma-kun Chương 2: Triệu Hồi Ma Th&#250;</a>
            </span>
            <span class="publishedDate">29/06/2019 03:32</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-374420">
            <span class="title">
                <a id="c_374420" href="/c374420/mairimashita-iruma-kun-21473-chuong-1-ngoi-truong-ac-ma-cua-iruma-kun" title="Mairimashita! Iruma-kun Chương 1: Ng&#244;i trường &#193;c Ma của Iruma-kun" >Mairimashita! Iruma-kun Chương 1: Ng&#244;i trường &#193;c Ma của Iruma-kun</a>
            </span>
            <span class="publishedDate">29/06/2019 03:31</span>
            <span class="download">
            </span>
        </p>
        <p id="chapter-402567">
            <span class="title">
                <a id="c_402567" href="/c402567/mairimashita-iruma-kun-21473-omake-4koma-volume-8" title="Mairimashita! Iruma-kun Omake: 4koma Volume 8" >Mairimashita! Iruma-kun Omake: 4koma Volume 8</a>
            </span>
            <span class="publishedDate">24/10/2019 08:47</span>
            <span class="download">
            </span>
        </p>
</div>

            </div>
        </div>


    <div class="al-c social-button">
        Bấm
        <div class="fb-like" data-href="https://blogtruyen.com/21473/mairimashita-iruma-kun-21473" data-send="false" data-layout="button_count" data-width="110" data-show-faces="false"></div> để xem truyện nhanh hơn
    </div>


    <div class="votes">
        <div class="vote-statictis">
            <span class="pull-left fs-16 text-green">Tiếc gì một like nào các bter!!! </span>
            <span class="total-vote" ng-init="TotalLikeOrDisLike=1194; TotalLike=1185; TotalDisLike=9" ng-cloak>
                {{cTotalLikeOrDisLike}}
            </span>
            <div class="clear-fix"></div>
        </div>
        <div class="progress">
            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="{{TotalLike * 100 / TotalLikeOrDisLike}}" aria-valuemin="0" aria-valuemax="100" style="width: {{TotalLike * 100 / TotalLikeOrDisLike}}%;">
                <span class="sr-only"></span>
            </div>
        </div>
    </div>


    <hr />
    <div class="relative-storys">
        <p class="title">Các truyện cùng người đăng</p>
        <div class="lst">
            <ul class="list-unstyled">
                    <li>
                        <a href="/5613/owari-no-seraph" title="đọc truyện Owari no Seraph Update Chương 113: B&#237; mật của mọi người" class="tiptip" data-tiptip="tiptip-5613">
                            <img src="https://i7.xem-truyen.com/manga/5/5613/volume_26.thumb_110x110.png" alt="truyện tranh Owari no Seraph Update Chương 113: B&#237; mật của mọi người" class="img" />
                        </a>
                        <div class="hidden tiptip-content" id="tiptip-5613">
                            <p class="al-c color-lightgreen line-height-15 fs-14 bold">Owari no Seraph Update Chương 113: B&#237; mật của mọi người</p>
                            <p class="line-height-15 fs-12">
                                    
 V&#224;o ng&#224;y nọ, một loại vi r&#250;t b&#237; ẩn lan rộng to&#224;n cầu v&#224; l&#226;y nhiễm cho tất cả những ai hơn 13 tuổi, đưa họ tới c&#225;i chết. C&#249;ng l&#250;c đ&#243;, Vampire xuất hiện, đưa Tr&#225;i Đất v&#224;o b&#243;ng tối v&#224; con người bị bắt l&#224;m n&#244; lệ. Hyakuya Yuuichirou, một cậu b&#233; đang sống c&#249;ng với những đứa trẻ mồ c&#244;i, d&#249; đang trong...
                            </p>
                        </div>
                    </li>
                    <li>
                        <a href="/21443/kemono-jihen-nhom-wicked-house" title="đọc truyện Kemono Jihen Update Chương 40: Nữ thần" class="tiptip" data-tiptip="tiptip-21443">
                            <img src="https://i7.xem-truyen.com/manga/21/21443/cover.thumb_110x110.png" alt="truyện tranh Kemono Jihen Update Chương 40: Nữ thần" class="img" />
                        </a>
                        <div class="hidden tiptip-content" id="tiptip-21443">
                            <p class="al-c color-lightgreen line-height-15 fs-14 bold">Kemono Jihen Update Chương 40: Nữ thần</p>
                            <p class="line-height-15 fs-12">
                                    

Kemono Jihen l&#224; c&#226;u chuyện kể về cậu thiếu ni&#234;n bị gọi l&#224; Dorotabo v&#224; bị d&#226;n l&#224;ng tr&#225;nh như tr&#225;nh t&#224;, v&#224; Inugami, một th&#225;m tử chuy&#234;n về linh dị huyền b&#237;. C&#226;u chuyện bắt đều khi Inugami đến thị trấn của cậu để điều tra về trường hợp gia s&#250;c chết h&#224;ng hoạt v&#224; x&#225;c của ch&#250;ng bị thối rữa trong một...
                            </p>
                        </div>
                    </li>
                    <li>
                        <a href="/21467/fate-grand-order-turas-realta" title="đọc truyện Fate/Grand Order -turas realta- Update Chương 43: Kh&#250;c tang ca của những anh h&#249;ng I" class="tiptip" data-tiptip="tiptip-21467">
                            <img src="https://i7.xem-truyen.com/manga/21/21467/01.thumb_110x110.jpg" alt="truyện tranh Fate/Grand Order -turas realta- Update Chương 43: Kh&#250;c tang ca của những anh h&#249;ng I" class="img" />
                        </a>
                        <div class="hidden tiptip-content" id="tiptip-21467">
                            <p class="al-c color-lightgreen line-height-15 fs-14 bold">Fate/Grand Order -turas realta- Update Chương 43: Kh&#250;c tang ca của những anh h&#249;ng I</p>
                            <p class="line-height-15 fs-12">
                                    Dự &#225;n Manga dựa tr&#234;n tựa game mobile Fate/Grand Order của Type-Moon v&#224; Aniplex
                            </p>
                        </div>
                    </li>
                    <li>
                        <a href="/21494/ho-so-cua-lord-el-melloi-ii" title="đọc truyện Hồ Sơ của Lord El-Melloi II Update File: 32" class="tiptip" data-tiptip="tiptip-21494">
                            <img src="https://i7.xem-truyen.com/manga/21/21494/001.thumb_110x110.jpg" alt="truyện tranh Hồ Sơ của Lord El-Melloi II Update File: 32" class="img" />
                        </a>
                        <div class="hidden tiptip-content" id="tiptip-21494">
                            <p class="al-c color-lightgreen line-height-15 fs-14 bold">Hồ Sơ của Lord El-Melloi II Update File: 32</p>
                            <p class="line-height-15 fs-12">
                                    &quot;...Theo một nghĩa n&#224;o đ&#243;, c&#243; thể n&#243;i rằng ph&#225;p sư hiện đại ch&#237;nh l&#224; nghề sưu tập thi&#234;n sứ&quot;. &quot;Th&#225;p Đồng Hồ&quot;. Đ&#243; l&#224; trung t&#226;m của thế giới ph&#225;p sư. Đại bản doanh của Hiệp Hội Ph&#225;p Sư, nơi nắm giữ những thần b&#237; qu&#253; gi&#225;. El-Melloi II, Lord của Khoa Ma Thuật Hiện Đại trong &quot;Th&#225;p Đồng Hồ&quot; n&#224;y, v&#236; một số...
                            </p>
                        </div>
                    </li>
                    <li>
                        <a href="/21593/orient-21593" title="đọc truyện Orient" class="tiptip" data-tiptip="tiptip-21593">
                            <img src="https://i7.xem-truyen.com/manga/21/21593/Untitled-1.thumb_110x110.jpg" alt="truyện tranh Orient" class="img" />
                        </a>
                        <div class="hidden tiptip-content" id="tiptip-21593">
                            <p class="al-c color-lightgreen line-height-15 fs-14 bold">Orient </p>
                            <p class="line-height-15 fs-12">
                                    Một thế giới lấy bối cảnh thời Chiến Quốc Nhật Bản, nơi đang bị thế lực của lo&#224;i Quỷ do c&#225;c Quỷ Thần thao t&#250;ng. Musashi, cậu thiếu ni&#234;n sống trong x&#227; hội xem lo&#224;i Quỷ như những vị Thần đ&#227; c&#243; một ước ơ tr&#225;i ngược với người d&#226;n ở đ&#243;, l&#224; đ&#225;nh đuổi thế lực của Quỷ Thần để gi&#224;nh lại quyền tự do con...
                            </p>
                        </div>
                    </li>
            </ul>
        </div>
    </div>



	

	
    <div class="comment-area">
        <div class="tab-comments">
            <a href="javascript:MangaLoadComment(1)" class="link-reload-comments fl-l">
                <span class="icon-refresh"></span>
                <span class="text-black">Làm mới bình luận</span>
            </a>

            <a href="#fb-comment" class="tab-comment fl-r ml10 ">
                <span class="icon-facebook"></span>
                <span>FB Comments (<fb:comments-count href="https://blogtruyen.com/21473/mairimashita-iruma-kun-21473"></fb:comments-count>)</span>
            </a>
            <a href="#bt-comment" class="tab-comment fl-r selected">
                <span class="icon-blogtruyen"></span>
                <span>BT Comments (<span id="count-bt-comment">0</span>)</span>
            </a>
            <div class="clearfix"></div>
        </div>

        <!--COMMENT-->
        <section class="bg-white comments">
            <div id="bt-comment" class="bt-comment" >
                <div id="list-comment" class="ajax-content list-comment" data-url="/ajax/Comment/AjaxLoadComment?mangaId=21473">
                    


<div class="overlay-content-property">
    <img src="/Content/images/loading.gif" class="img-load" alt="loading..." />
    <p>Đang tải...</p>
</div>
                </div>
                <div id="form-comment">
                    <hr />
                    <br />
                    <h3 class="bold fs-16">ĐĂNG LỜI BÌNH</h3>
                    <br />
                            <div class="uploading-comment mt5 text-danger"><i class="ajax-loader-1"></i> Đang upload ảnh ...</div>
                            <form action="#" method="post" class="FormComment" id="FormComment">
                                <textarea class="editorcomment" name="MangaComment" id="MangaComment" cols="12" rows="15"></textarea><br />
                                <button class="pointer btn btn-forum" type="submit">Đăng</button>
                            </form>
                </div>
            </div>

            <div id="fb-comment" class="fb-comments al-c" data-href="https://blogtruyen.com/21473/mairimashita-iruma-kun-21473" data-numposts="12" data-mobile="auto-detect" data-width="610" style=display:none></div>
        </section>


    </div>
</section>
<input id="commentFileupload" type="file" name="commentFileupload" class="hidden" accept="image/*">




<div class="modal fade" id="loadNotifyComment" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">Bình luận mới</h4>
            </div>
            <div class="modal-body list-comment">
                


<div class="overlay-content-property">
    <img src="/Content/images/loading.gif" class="img-load" alt="loading..." />
    <p>Đang tải...</p>
</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng lại</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

                    </div>
                    <div class="col-md-4 sidebar">
					    <!--\\ Top sidebar group like box //-->
<center><br></center>
                        

<div data-cookie-id="widgetTopManga" class="portlet ui-widget ui-widget-content ui-helper-clearfix">
    <div class="portlet-header bg-coral">Truyện hay</div>
    <div class="portlet-content tabs" id="tab-hot-story" style="display:none">
        <ul>
            <li><a href="#tabs-top-hot">TOP HOT</a></li>
            <li><a href="#tabs-top-week">TOP WEEK</a></li>
            <li><a href="#tabs-top-all">TOP ALL</a></li>
        </ul>
        <div id="tabs-top-hot">
                <p>
                    <span class="ellipsis">1. <a href="/20609/chinhchumskteam" title="Spy X Family">Spy X Family</a></span>
                    <span class="fl-r fs-11">3.519 views</span>
                </p>
                <p>
                    <span class="ellipsis">2. <a href="/26949/dandadan" title="Dandadan!!">Dandadan!!</a></span>
                    <span class="fl-r fs-11">2.935 views</span>
                </p>
                <p>
                    <span class="ellipsis">3. <a href="/17275/vo-luyen-dinh-phong" title="V&#245; Luyện Đỉnh Phong">V&#245; Luyện Đỉnh Phong</a></span>
                    <span class="fl-r fs-11">2.817 views</span>
                </p>
                <p>
                    <span class="ellipsis">4. <a href="/25063/nano-machine" title="Nano Ma Thần">Nano Ma Thần</a></span>
                    <span class="fl-r fs-11">2.713 views</span>
                </p>
                <p>
                    <span class="ellipsis">5. <a href="/20630/anh-hung-bong-toi-manh-nhat-nhung-thanh-vien-trong-doi-da-phan-boi-toi-nen-toi-se-dong-hanh-cung-con-quai-vat-manh-nhat" title="Anh H&#249;ng B&#243;ng Tối Mạnh Nhất - Những Th&#224;nh Vi&#234;n Trong Đội Đ&#227; Phản Bội T&#244;i N&#234;n T&#244;i Sẽ Đồng H&#224;nh C&#249;ng Con Qu&#225;i Vật Mạnh Nhất">Anh H&#249;ng B&#243;ng Tối Mạnh Nhất - Những Th&#224;nh Vi&#234;n Trong Đội Đ&#227; Phản Bội T&#244;i N&#234;n T&#244;i Sẽ Đồng H&#224;nh C&#249;ng Con Qu&#225;i Vật Mạnh Nhất</a></span>
                    <span class="fl-r fs-11">2.641 views</span>
                </p>
                <p>
                    <span class="ellipsis">6. <a href="/28020/co-gai-luoi-doc-ngot-ngao" title="C&#244; g&#225;i lưỡi độc ngọt ng&#224;o">C&#244; g&#225;i lưỡi độc ngọt ng&#224;o</a></span>
                    <span class="fl-r fs-11">2.376 views</span>
                </p>
                <p>
                    <span class="ellipsis">7. <a href="/139/one-piece" title="One Piece">One Piece</a></span>
                    <span class="fl-r fs-11">2.017 views</span>
                </p>
                <p>
                    <span class="ellipsis">8. <a href="/26175/ao-ashi" title="Ao Ashi">Ao Ashi</a></span>
                    <span class="fl-r fs-11">1.942 views</span>
                </p>
                <p>
                    <span class="ellipsis">9. <a href="/20624/boku-no-kokoro-yanbai-yatsu" title="Boku No Kokoro No Yabai Yatsu">Boku No Kokoro No Yabai Yatsu</a></span>
                    <span class="fl-r fs-11">1.828 views</span>
                </p>
                <p>
                    <span class="ellipsis">10. <a href="/29462/tomboy-gf" title="Tomboy GF">Tomboy GF</a></span>
                    <span class="fl-r fs-11">1.775 views</span>
                </p>
                <p>
                    <span class="ellipsis">11. <a href="/23128/sex-and-dungeon" title="Sex And Dungeon">Sex And Dungeon</a></span>
                    <span class="fl-r fs-11">1.658 views</span>
                </p>
                <p>
                    <span class="ellipsis">12. <a href="/3495/maoyuu-maoh-yuusha" title="Maoyuu Maou Yuusha">Maoyuu Maou Yuusha</a></span>
                    <span class="fl-r fs-11">1.619 views</span>
                </p>
                <p>
                    <span class="ellipsis">13. <a href="/15924/my-kingdom-silent-war" title="My Kingdom (Silent War)">My Kingdom (Silent War)</a></span>
                    <span class="fl-r fs-11">1.525 views</span>
                </p>
                <p>
                    <span class="ellipsis">14. <a href="/29758/hau-gai-cung-lop-cua-toi" title="Hầu g&#225;i c&#249;ng lớp của t&#244;i">Hầu g&#225;i c&#249;ng lớp của t&#244;i</a></span>
                    <span class="fl-r fs-11">1.450 views</span>
                </p>
                <p>
                    <span class="ellipsis">15. <a href="/24537/su-tro-lai-cua-phap-su-vi-dai-sau-4000-nam-mega-team" title="Sự Trở Lại Của Ph&#225;p Sư Vĩ Đại Sau 4000 Năm">Sự Trở Lại Của Ph&#225;p Sư Vĩ Đại Sau 4000 Năm</a></span>
                    <span class="fl-r fs-11">1.348 views</span>
                </p>
        </div>
        <div id="tabs-top-week">
                <p>
                    <span class="ellipsis">1. <a href="/3415/onepunch-man" title="Onepunch-Man">Onepunch-Man</a></span>
                    <span class="fl-r fs-11">115.212</span>
                </p>
                <p>
                    <span class="ellipsis">2. <a href="/20609/chinhchumskteam" title="Spy X Family">Spy X Family</a></span>
                    <span class="fl-r fs-11">115.196</span>
                </p>
                <p>
                    <span class="ellipsis">3. <a href="/17275/vo-luyen-dinh-phong" title="V&#245; Luyện Đỉnh Phong">V&#245; Luyện Đỉnh Phong</a></span>
                    <span class="fl-r fs-11">103.550</span>
                </p>
                <p>
                    <span class="ellipsis">4. <a href="/139/one-piece" title="One Piece">One Piece</a></span>
                    <span class="fl-r fs-11">92.821</span>
                </p>
                <p>
                    <span class="ellipsis">5. <a href="/26175/ao-ashi" title="Ao Ashi">Ao Ashi</a></span>
                    <span class="fl-r fs-11">91.947</span>
                </p>
                <p>
                    <span class="ellipsis">6. <a href="/22662/a-story-about-a-grampa-and-granma-returned-back-to-their-youth" title="&#212;ng B&#224; Hồi Xu&#226;n">&#212;ng B&#224; Hồi Xu&#226;n</a></span>
                    <span class="fl-r fs-11">73.789</span>
                </p>
                <p>
                    <span class="ellipsis">7. <a href="/25791/rosen-garten-saga" title="Rosen Garten Saga">Rosen Garten Saga</a></span>
                    <span class="fl-r fs-11">51.899</span>
                </p>
                <p>
                    <span class="ellipsis">8. <a href="/18242/tonikaku-cawaii" title="Tonikaku Kawaii">Tonikaku Kawaii</a></span>
                    <span class="fl-r fs-11">44.786</span>
                </p>
                <p>
                    <span class="ellipsis">9. <a href="/18552/jujutsu-kaisen" title="Jujutsu Kaisen -  Ch&#250; Thuật Hồi Chiến">Jujutsu Kaisen -  Ch&#250; Thuật Hồi Chiến</a></span>
                    <span class="fl-r fs-11">44.514</span>
                </p>
                <p>
                    <span class="ellipsis">10. <a href="/9947/yeu-than-ky" title="Y&#234;u Thần K&#253;">Y&#234;u Thần K&#253;</a></span>
                    <span class="fl-r fs-11">43.298</span>
                </p>
                <p>
                    <span class="ellipsis">11. <a href="/22146/cac-one-shot-cua-fujiko-fujio" title="C&#225;c one-shot của Fujiko F. Fujio">C&#225;c one-shot của Fujiko F. Fujio</a></span>
                    <span class="fl-r fs-11">41.790</span>
                </p>
                <p>
                    <span class="ellipsis">12. <a href="/26825/ta-co-mot-son-trai" title="Ta C&#243; Một Sơn Trại">Ta C&#243; Một Sơn Trại</a></span>
                    <span class="fl-r fs-11">38.995</span>
                </p>
                <p>
                    <span class="ellipsis">13. <a href="/15924/my-kingdom-silent-war" title="My Kingdom (Silent War)">My Kingdom (Silent War)</a></span>
                    <span class="fl-r fs-11">38.766</span>
                </p>
                <p>
                    <span class="ellipsis">14. <a href="/11305/kaguya-sama-wa-kokurasetai-tensai-tachi-no-renai-zunousen" title="Kaguya-sama wa Kokurasetai - Tensai-tachi no Renai Zunousen">Kaguya-sama wa Kokurasetai - Tensai-tachi no Renai Zunousen</a></span>
                    <span class="fl-r fs-11">38.586</span>
                </p>
                <p>
                    <span class="ellipsis">15. <a href="/242/hiep-khach-giang-ho" title="Hiệp Kh&#225;ch Giang Hồ">Hiệp Kh&#225;ch Giang Hồ</a></span>
                    <span class="fl-r fs-11">35.811</span>
                </p>
        </div>
        <div id="tabs-top-all">
                <p>
                    <span class="ellipsis">1. <a href="/242/hiep-khach-giang-ho" title="Hiệp Kh&#225;ch Giang Hồ">Hiệp Kh&#225;ch Giang Hồ</a></span>
                    <span class="fl-r fs-11">62.351.486</span>
                </p>
                <p>
                    <span class="ellipsis">2. <a href="/139/one-piece" title="One Piece">One Piece</a></span>
                    <span class="fl-r fs-11">50.042.343</span>
                </p>
                <p>
                    <span class="ellipsis">3. <a href="/133/naruto" title="Naruto">Naruto</a></span>
                    <span class="fl-r fs-11">45.547.990</span>
                </p>
                <p>
                    <span class="ellipsis">4. <a href="/118/conan" title="Conan">Conan</a></span>
                    <span class="fl-r fs-11">33.999.256</span>
                </p>
                <p>
                    <span class="ellipsis">5. <a href="/162/bleach" title="Bleach">Bleach</a></span>
                    <span class="fl-r fs-11">27.835.160</span>
                </p>
                <p>
                    <span class="ellipsis">6. <a href="/3415/onepunch-man" title="Onepunch-Man">Onepunch-Man</a></span>
                    <span class="fl-r fs-11">22.714.351</span>
                </p>
                <p>
                    <span class="ellipsis">7. <a href="/86/fairy-tail" title="Fairy Tail">Fairy Tail</a></span>
                    <span class="fl-r fs-11">21.400.967</span>
                </p>
                <p>
                    <span class="ellipsis">8. <a href="/150/nozoki-ana" title="Nozoki Ana">Nozoki Ana</a></span>
                    <span class="fl-r fs-11">21.335.901</span>
                </p>
                <p>
                    <span class="ellipsis">9. <a href="/41/dragon-ball-original" title="Dragon Ball Bản Vip - Bản Đẹp Nguy&#234;n Gốc">Dragon Ball Bản Vip - Bản Đẹp Nguy&#234;n Gốc</a></span>
                    <span class="fl-r fs-11">20.150.383</span>
                </p>
                <p>
                    <span class="ellipsis">10. <a href="/137/gantz" title="Gantz">Gantz</a></span>
                    <span class="fl-r fs-11">18.201.042</span>
                </p>
                <p>
                    <span class="ellipsis">11. <a href="/5898/inuyasha-remake" title="Inuyasha Bản Đẹp">Inuyasha Bản Đẹp</a></span>
                    <span class="fl-r fs-11">16.333.263</span>
                </p>
                <p>
                    <span class="ellipsis">12. <a href="/631/minamoto-kun-monogatari" title="Minamoto kun Monogatari">Minamoto kun Monogatari</a></span>
                    <span class="fl-r fs-11">16.213.001</span>
                </p>
                <p>
                    <span class="ellipsis">13. <a href="/507/dau-an-rong-thieng" title="Dấu ấn rồng thi&#234;ng">Dấu ấn rồng thi&#234;ng</a></span>
                    <span class="fl-r fs-11">15.032.345</span>
                </p>
                <p>
                    <span class="ellipsis">14. <a href="/5/toriko" title="Toriko">Toriko</a></span>
                    <span class="fl-r fs-11">14.988.482</span>
                </p>
                <p>
                    <span class="ellipsis">15. <a href="/9947/yeu-than-ky" title="Y&#234;u Thần K&#253;">Y&#234;u Thần K&#253;</a></span>
                    <span class="fl-r fs-11">14.231.496</span>
                </p>
        </div>
    </div>
</div>



<div data-cookie-id="widgetNewManga" class="portlet ui-widget ui-widget-content ui-helper-clearfix">
    <div class="portlet-header bg-green">Truyện mới đăng</div>
    <div class="portlet-content" id="top-newest-story" style="display:none">
            <a href="/29998/to-yeu-cau-voi-tu-cach-mot-nguoi-ban" title="Tớ y&#234;u cậu với tư c&#225;ch một người bạn">
                <img src="https://i7.xem-truyen.com/manga/29/29998/f430683f-9c82-4661-9f12-99677aa5b38f.thumb_110x110.jpg" alt="Tớ y&#234;u cậu với tư c&#225;ch một người bạn" />
            </a>
            <a href="/29997/kho" title="Kh&#244; cốt hiệp sĩ">
                <img src="https://i7.xem-truyen.com/manga/29/29997/s001.thumb_110x110.jpg" alt="Kh&#244; cốt hiệp sĩ" />
            </a>
            <a href="/29996/ookami-ni-naritai" title="Ookami ni Naritai">
                <img src="https://i7.xem-truyen.com/manga/29/29996/4d8e974d-6e91-4831-b599-0421296e4f81.thumb_110x110.jpg" alt="Ookami ni Naritai" />
            </a>
            <a href="/29995/kimi-tte-donna-nioi-nano" title="Kimi tte Donna Nioi nano?">
                <img src="https://i7.xem-truyen.com/manga/29/29995/b56478ab-98d3-4d82-b2c1-5894eb2e6665-je2j.thumb_110x110.jpg" alt="Kimi tte Donna Nioi nano?" />
            </a>
            <a href="/29993/the-dunwich-horror-dunwich-no-kai" title="The Dunwich Horror - Dunwich no Kai">
                <img src="https://i7.xem-truyen.com/manga/29/29993/322102000209.thumb_110x110.jpg" alt="The Dunwich Horror - Dunwich no Kai" />
            </a>
            <a href="/29992/mot-trong-bay-ty-bat-thuong-en" title="Một trong bảy tỷ bất thường - English">
                <img src="https://i7.xem-truyen.com/manga/29/29992/one-of-a-kind-irregular.thumb_110x110.jpg" alt="Một trong bảy tỷ bất thường - English" />
            </a>
            <a href="/29991/hay-song-het-suc-minh" title="Sachiare">
                <img src="https://i7.xem-truyen.com/manga/29/29991/b7bb5136-1c5d-494c-b49a-54d8c00db646.thumb_110x110.png" alt="Sachiare" />
            </a>
            <a href="/29989/vinh-biet-eri" title="Vĩnh biệt Eri">
                <img src="https://i7.xem-truyen.com/manga/29/29989/1-je2j.thumb_110x110.jpg" alt="Vĩnh biệt Eri" />
            </a>
            <a href="/29988/pesu-on-my-head" title="Pesu on my head">
                <img src="https://i7.xem-truyen.com/manga/29/29988/2-je2j.thumb_110x110.jpg" alt="Pesu on my head" />
            </a>
            <a href="/29987/shark" title="Shark ">
                <img src="https://i7.xem-truyen.com/manga/29/29987/fddd0d20d5fe817097040bc45c0ed840.thumb_110x110.jpg" alt="Shark " />
            </a>
            <a href="/29986/inu-ni-nattara-suki-na-hito-ni-hirowareta" title="Inu ni nattara suki na hito ni hirowareta">
                <img src="https://i7.xem-truyen.com/manga/29/29986/ba.thumb_110x110.jpg" alt="Inu ni nattara suki na hito ni hirowareta" />
            </a>
            <a href="/29985/goodbye-eri" title="Goodbye, Eri">
                <img src="https://i7.xem-truyen.com/manga/29/29985/hqdefault.thumb_110x110.jpg" alt="Goodbye, Eri" />
            </a>
            <a href="/29983/my-girlfriend-s-a-bl-author-what-do-i-do" title="My Girlfriend&#39;s a BL Author, What Do I Do?">
                <img src="https://i7.xem-truyen.com/manga/29/29983/ba.thumb_110x110.jpg" alt="My Girlfriend&#39;s a BL Author, What Do I Do?" />
            </a>
            <a href="/29982/thu-gui-adolf" title="Thư gửi Adolf">
                <img src="https://i7.xem-truyen.com/manga/29/29982/adorufu_ni_tsugu_01_fc.thumb_110x110.jpg" alt="Thư gửi Adolf" />
            </a>
            <a href="/29981/the-wife-who-can-read-her-husband-s-mind" title="The wife who can read her husband’s mind">
                <img src="https://i7.xem-truyen.com/manga/29/29981/46925ed5-0a28-4ab1-8576-3441b7c131ac.thumb_110x110.png" alt="The wife who can read her husband’s mind" />
            </a>
    </div>
</div>



    <div data-cookie-id="widgetComment" class="portlet ui-widget ui-widget-content ui-helper-clearfix">
        <div class="portlet-header bg-yellow">Bình luận mới</div>
        <div class="portlet-content" id="top-newest-comment" style="display:none">
            <article>
                    <img src="https://i7.xem-truyen.com/avatar/235/235414/tixung.thumb_64x64.jpg" />

                    <span class="color-u-1 bold">wan_wan</span>

                <div class="al-j break-word">
                    <p></p>
                </div>
                <p class="link ellipsis">
                    14/04/2022 17:26 &emsp;


                    <a href="/29998/to-yeu-cau-voi-tu-cach-mot-nguoi-ban#bt-comment">Tớ y&#234;u cậu với tư c&#225;ch một người bạn</a>
                </p>
                <div class="clear-fix"></div>
            </article>
            <article>
                    <img src="https://i7.xem-truyen.com/avatar/140/140243/483907778155647054473262906572040431468544o.thumb_64x64.jpg" />

                    <span class="color-u-1 bold">『T.Neko712』</span>

                <div class="al-j break-word">
                    <p>siêu wholesome, truyện lừa</p>
                </div>
                <p class="link ellipsis">
                    14/04/2022 17:21 &emsp;


                    <a href="/29998/to-yeu-cau-voi-tu-cach-mot-nguoi-ban#bt-comment">Tớ y&#234;u cậu với tư c&#225;ch một người bạn</a>
                </p>
                <div class="clear-fix"></div>
            </article>
            <article>
                    <img src="https://i7.xem-truyen.com/avatar/138/138899/c6d38dc8 d3ee 4695 ae3f 6a335b39b127.thumb_64x64.jpeg" />

                    <span class="color-u-2 bold">daisuki_imouto94</span>

                <div class="al-j break-word">
                    <p>ờ</p>
                </div>
                <p class="link ellipsis">
                    14/04/2022 17:19 &emsp;


                    <a href="/3495/maoyuu-maoh-yuusha#bt-comment">Maoyuu Maou Yuusha</a>
                </p>
                <div class="clear-fix"></div>
            </article>
            <article>
                    <img src="https://i7.xem-truyen.com/avatar/114/114440/fbimg15504363159919765.thumb_64x64.jpg" />

                    <span class="color-u-1 bold">C&#225; Mập Nước Ngọt</span>

                <div class="al-j break-word">
                    Thôi qua eng. Dịch a đuồi còn chơi cắt chap
                </div>
                <p class="link ellipsis">
                    14/04/2022 17:18 &emsp;


                    <a href="/18414/yamemasu-tsugi-no-shokuba-ha-mao-jo#bt-comment">Yamemasu Tsugi No Shokuba Ha Mao Jo</a>
                </p>
                <div class="clear-fix"></div>
            </article>
            <article>
                    <img src="https://i7.xem-truyen.com/avatar/235/235414/tixung.thumb_64x64.jpg" />

                    <span class="color-u-1 bold">wan_wan</span>

                <div class="al-j break-word">
                    <p></p>
                </div>
                <p class="link ellipsis">
                    14/04/2022 17:17 &emsp;


                    <a href="/29998/to-yeu-cau-voi-tu-cach-mot-nguoi-ban#bt-comment">Tớ y&#234;u cậu với tư c&#225;ch một người bạn</a>
                </p>
                <div class="clear-fix"></div>
            </article>
            <article>
                    <img src="https://i7.xem-truyen.com/avatar/237/237163/trmtriuhtmarikhnghtnorinhmch_ttcngitnggpkhngmtngingunhin.thumb_64x64.jpg" />

                    <span class="color-u-1 bold">Rainych Team</span>

                <div class="al-j break-word">
                    <p>Cảm ơn bạn nhé!</p>
                </div>
                <p class="link ellipsis">
                    14/04/2022 17:14 &emsp;


                    <a href="/29690/van-ton-tai-mot-noi-de-tro-ve-29690#bt-comment">Vẫn tồn tại một nơi để trở về</a>
                </p>
                <div class="clear-fix"></div>
            </article>
            <article>
                    <img src="https://i7.xem-truyen.com/avatar/noavatar/noavatar.thumb_64x64.png" />

                    <span class="color-u-1 bold">thinh133</span>

                <div class="al-j break-word">
                    <p>drama</p>
                </div>
                <p class="link ellipsis">
                    14/04/2022 17:07 &emsp;


                    <a href="/29998/to-yeu-cau-voi-tu-cach-mot-nguoi-ban#bt-comment">Tớ y&#234;u cậu với tư c&#225;ch một người bạn</a>
                </p>
                <div class="clear-fix"></div>
            </article>
            <article>
                    <img src="https://i7.xem-truyen.com/avatar/235/235248/d18ba3bf-ba43-4f5e-812e-051014843774-je2j.thumb_64x64.jpg" />

                    <span class="color-u-1 bold">Tnguy&#234;n</span>

                <div class="al-j break-word">
                    <p> </p>
                </div>
                <p class="link ellipsis">
                    14/04/2022 17:04 &emsp;


                    <a href="/29989/vinh-biet-eri#bt-comment">Vĩnh biệt Eri</a>
                </p>
                <div class="clear-fix"></div>
            </article>
            <article>
                    <img src="https://i7.xem-truyen.com/avatar/noavatar/noavatar.thumb_64x64.png" />

                    <span class="bold">No name</span>

                <div class="al-j break-word">
                    Chuyện đọc đúng là rất cần thời gian để suy nghĩ lúc đầu đọc thì tôi đã nghĩ là "bộ này viết về cái cl gì vậy" nhưng đọc lại vài lần và ngẫm nghĩ thì đúng là nó hay thật<img src='https://i.blogtruyen.com/emo/yahoo/21.gif'/>
                </div>
                <p class="link ellipsis">
                    14/04/2022 16:55 &emsp;


                    <a href="/29989/vinh-biet-eri#bt-comment">Vĩnh biệt Eri</a>
                </p>
                <div class="clear-fix"></div>
            </article>
            <article>
                    <img src="https://i7.xem-truyen.com/avatar/210/210975/16296410767522.thumb_64x64.jpg" />

                    <span class="color-u-1 bold">Sky Translation</span>

                <div class="al-j break-word">
                    <p>từ từ nào bro</p>
<p> </p>
                </div>
                <p class="link ellipsis">
                    14/04/2022 16:54 &emsp;


                    <a href="/29986/inu-ni-nattara-suki-na-hito-ni-hirowareta#bt-comment">Inu ni nattara suki na hito ni hirowareta</a>
                </p>
                <div class="clear-fix"></div>
            </article>
        </div>
    </div>


<!--- tc-left  -->
<script src="https://qcv5.blogtruyen.vn/Data/data_script/bt_script_load_16_0.js"></script>

<!--- tc-left 250 -->
<script src="https://qcv5.blogtruyen.vn/Data/data_script/bt_script_load_25_0.js"></script>

<!--- tc-right-->
<script src="https://qcv5.blogtruyen.vn/Data/data_script/bt_script_load_48_0.js?=7"></script>

<!--- tc-right250 -->
<script src="https://qcv5.blogtruyen.vn/Data/data_script/bt_script_load_13_0.js"></script>
<!--- tc-right250 -->
 
</body>
</html>

''';
