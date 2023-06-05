<?php

$workflowDirectory = __DIR__ . '/.github/workflows';
define('WORKFLOW_STAGGER_OFFSET_MINUTES', 5);

$workflowDay = 4;
$workflowHour = 0;
$workflowMinute = 0;

$workflowFiles = scandir($workflowDirectory);
$workflowFiles = array_filter($workflowFiles, fn ($file) => str_ends_with($file, '.yml'));

foreach ($workflowFiles as $workflowFile) {
    $workflowMinute += WORKFLOW_STAGGER_OFFSET_MINUTES;
    if ($workflowMinute >= 60) {
        $workflowMinute = 0;
        $workflowHour++;
    }
    if ($workflowHour >= 24) {
        $workflowHour = 0;
        $workflowDay++;
    }
    if ($workflowDay >= 6) {
        $workflowDay = 0;
    }
    $workflowContents = file_get_contents($workflowDirectory . '/' . $workflowFile);
    $workflowContents = preg_replace('/- cron: "\d+ \d+ \* \* \d+"/', '- cron: "' . $workflowMinute . ' ' . $workflowHour . ' * * ' . $workflowDay . '"', $workflowContents, 1, $count);    if ($count !== 1) {
        throw new Exception('Failed to replace cron in ' . $workflowFile);
    }
    file_put_contents($workflowDirectory . '/' . $workflowFile, $workflowContents);

}

