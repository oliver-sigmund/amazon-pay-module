[{if 'oxidamazon'|array_key_exists:$oView->getPaymentList() && !$oViewConf->isAmazonExclude()}]
    [{include file='amazonpay/wave_change_payment_block.tpl'}]
[{/if}]
[{if !$oViewConf->isAmazonSessionActive() || $oViewConf->isAmazonExclude()}]
    [{$smarty.block.parent}]
[{elseif 'oxidamazon'|array_key_exists:$oView->getPaymentList()}]
    [{include file='amazonpay/wave_change_payment_form.tpl'}]
[{/if}]