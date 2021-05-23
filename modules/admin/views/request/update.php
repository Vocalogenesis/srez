<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\modules\admin\models\Request */

$this->title = 'Редактировать запрос: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Запросы', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Сохранить';
?>
<div class="request-update">

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
