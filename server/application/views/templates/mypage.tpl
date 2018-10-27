{include file="header.tpl" title="My Page" user=$user}

<!--add the special style sheet of this page here!-->
<style media="screen">
  .u-pd-lr30{
    padding: 0 30px;
  }
  .u-pt30{
    padding-top: 30px;
  }
  .u-pt100{
    padding-top: 100px;
  }
  .p-button-main{
    width: 100%;
    border-radius: 20px;
    line-height: 40px;
    background-color: #FF2525;
    color: #ffffff
  }
  .input-group-addon{

  }
</style>

<!--put the main components of this page-->
<section class="u-pd-lr30">
  <!--Title-->
  <h2 class="u-pt50 text-center">My Page</h1>
  <div class="media u-pt30">
  	<span class="media-left">
      <img class="p-user_icon" src="../images/user.jpg">
  	</span>
  	<div class="media-body u-pl30">
  		<h4 class="media-heading">{$user['name']|escape}</h4>
        <script>
          $(function() {
            // RateItの設定 ...（2）
            $("#rateit1").rateit();
          });
        </script>
        <div class="u-pt10 rateit"></div>
  	</div>
  </div>

  <span>{$user['point']}</span>
  {if $user['type'] == "guide"}
    <span>
      <ul>
        {foreach $user['reviews'] as $review}
          <li>{$review}</li>
        {/foreach}
      </ul>
    <span>
  {else}
    <span>
      <ul>
        {foreach $user['histories'] as $history}
          <li>{$histories}</li>
        {/foreach}
      </ul>
    </span>
  {/if}

  <div class="u-pt30">
    <button class="p-button-main" type="button" name="button">Change Profiel</button>
  </div>
</section>

{include file="footer.tpl"}
