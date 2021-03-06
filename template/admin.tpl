{html_style}{literal}
.nice{
    display: inline-block;
    background: white;
    border-radius: 5px;
    font-family: "arial-black";
    font-size: 14px;
    color: black;
    padding: 4px 8px;
}
.parent {width: 100%;margin: 0 auto;align-content: left;}
.labels {width: 200px;float: left;}
.inputs {width: 200px;margin-left: 200px;}
.ta {border-radius:5px 5px 5px 5px;}
{/literal}{/html_style}

{combine_script id='LocalStorageCache' load='footer' path='admin/themes/default/js/LocalStorageCache.js'}
{combine_script id='jquery.selectize' load='footer' path='themes/default/js/plugins/selectize.min.js'}
{combine_css id='jquery.selectize' path="themes/default/js/plugins/selectize.{$themeconf.colorscheme}.css"}

{html_style}{literal}
form p {text-align:left;}
{/literal}{/html_style}

{footer_script}
jQuery(document).ready(function() {
  var groupsCache = new GroupsCache({
    serverKey: '{$CACHE_KEYS.groups}',
    serverId: '{$CACHE_KEYS._hash}',
    rootUrl: '{$ROOT_URL}'
  });
  groupsCache.selectize(jQuery('[data-selectize=groups]'));
});
{/footer_script}

<!-- Show the title of the plugin -->
<div class="titlePage">
  <h2>{'MugShot'|translate}</h2>
</div>

 <form method="post" id="footer_form" action="{$PLUGIN_ACTION}" class="general">

		<!-- Groups --><br>
		<div class="parent">
      <p>
    {if count($groups) > 0}
        <strong>{'The following groups can use MugShot to tag people'|@translate}</strong>
        <br></br>
        <select data-selectize="groups" data-value="{$groups_selected|@json_encode|escape:html}"
          placeholder="{'Type in a search term'|translate}"
          name="groups[]" multiple style="width:600px;"></select>
    {else}
        {'You have not created any groups!'|@translate} <a href="admin.php?page=group_list" class="externalLink">{'Group management'|@translate}</a>
    {/if}
      </p>

    {if count($groups) > 0}
    	<p class="formButtons">
    		<input type="submit" value="{'Save'|@translate}" name="save" />
    	</p>
    {/if}
		</div>
</form>
