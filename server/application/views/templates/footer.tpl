    </div>
  </div>
  <style media="screen">
    html,
    body {
    height: 100%;
    /* html と body 要素はパディングやマージンを持てません。*/
    }

    /* フッターを下部へ押しやるための、コンテンツのラッパー */
    #wrap {
    min-height: 100%;
    height: 100%;
    /* フッターの高さ分だけ、ネガティブインデントを指定 */
    margin: 0 auto -50px;
    /* フッターの高さ分だけ、パディングを指定 */
    padding: 0 0 50px;
    }

    /* ここでフッターの高さを指定 */
    #footer {
    position: absolute;
    bottom: 0;
    width: 100%;
    
    background-color: #ffffff;
    border-top: solid lightgray;
    }
    /* .border-lr{
      border: solid 1px;
      height: 60px;
    } */

    .glyphicon_footer{
      line-height: 2  ;
      color: gray;
    }
    .u-t20{
      font-size: 20px;
    }
    .u-color-gray{
      color: gray;
    }

  </style>
  <div id="footer">
    <div class="container">
      <div class="row">
        <div class="col-xs-4 text-center">
          <a href="/mypage"><span class="glyphicon glyphicon-user glyphicon_footer u-t20" aria-hidden="true"></span></a>
        </div>
        <div class="col-xs-4 text-center">
          <a href="/map" ><span class="glyphicon glyphicon-map-marker glyphicon_footer u-t20" aria-hidden="true"></span></a>
        </div>
        <div class="col-xs-4 text-center">
          <a href="/notification" ><span class="glyphicon glyphicon-comment glyphicon_footer u-t20" aria-hidden="true"></span></a>
        </div>
      </div>
    </div>
  </div>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="/js/bootstrap.min.js"></script>
  <script src="/js/RateIt/jquery.rateit.js"></script>
  </body>
</html>
