[{$smarty.block.parent}]
[{if $oViewConf->isAmazonActive() && $oViewConf->displayInPDP() && !$oViewConf->isAmazonExclude($oDetailsProduct->oxarticles__oxid->value) && !$oViewConf->isAmazonSessionActive()}]
    [{include file='amazonpay/wave_details_productmain_tobasket.tpl'}]
[{/if}]