{include file="header.tpl" title="Notifications" user=$user}
{ci_config name="base_url"}

<!--add the special style sheet of this page here!-->
<style media="screen">
  .u-pd-lr30{
    padding: 0 30px;
  }
  .u-pt10{
    padding-top: 10px;
  }
  .u-pt30{
    padding-top: 30px;
  }
  .u-pl30{
    padding-left: 30px;
  }
  .u-pt100{
    padding-top: 100px;
  }
  .u-pt50{
    padding-top: 50px;
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
  p,h1,h2,h3,h4{
    color: gray;
  }

  div.circle button.rateit-reset {
    display: none;
    width:50px;
    height:50px;
}
.p-user_icon{
  width: 125px;
  height: 125px;
  border-radius: 250px;
  border: solid 1px #FD5637;
}
.u-t12{
  font-size: 12px;
}
.panel-default{
  width: 100%;
  border: none;
  margin-top: -20px;
}
.p-user_icon{
  width: 40px;
  height: 40px;
  object-fit: cover;
  border-radius: 250px;
  border: solid 1px #FD5637;
  margin-bottom: 10px;
}
.review-item {
  background: #f4f4f4;
  color: #000;
  margin-bottom: 20px;
  padding: 20px;
  border-radius: 10px;
}
.review-date {
  margin-bottom: 10px;
}
.review-tourist {
  margin-bottom: 10px;
}
.review-tourist img {
  margin-right: 10px;
}
</style>

<!--put the main components of this page-->
<section class="u-pd-lr30">
  <!--Title-->
  <h2 class="text-center"></h1>
    <div class="panel panel-default">
    	<!-- <div class="panel-heading text-center">
    		<p class="text-center">Notifications</p>
    	</div> -->
      <div class="panel-body">
        {foreach $reviews as $review}
          <div class="review-item">
            <div class="review-date">{date("F j, Y, g:i a", strtotime($review['created_at']))}</div>
            <div class="review-tourist">
              <img src="{$base_url}/storage/profile_image/{$review['tourist_user_id']}" alt="" class="p-user_icon">
              <span class="review-name">{$review['tourist_user_name']|escape}</span>
              <span class="review-star">
                {if $review['star'] == 1}
                  ★☆☆☆☆ 1
                {else if $review['star'] == 2}
                  ★★☆☆☆ 2
                {else if $review['star'] == 3}
                  ★★★☆☆ 3
                {else if $review['star'] == 4}
                  ★★★★☆ 4
                {else if $review['star'] == 5}
                  ★★★★★ 5
                {/if}
              </span>
            </div>
            <div class="review-body">{$review['body']}</div>
          </div>
        {/foreach}
    	</div>
    </div>
  </div>
</section>

{include file="footer.tpl"}
