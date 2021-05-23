<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\Request */

$this->title = 'Создать запрос';
$this->params['breadcrumbs'][] = ['label' => 'Requests', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="request-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
    <?php
        
        $js = <<<JS
            $('.field-request-why_not').hide();
            $('#request-status').on('change', ()=>{
                if ($('#request-status').val() == 'Отклонена')
                {
                    $('.field-request-why_not').show();
                } else {
                    $('.field-request-why_not').hide();
                }
            });
        JS;
        $this->registerJs($js);

    ?>
</div>
