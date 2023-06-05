<?php

$workflowDirectory = __DIR__ . '/.github/workflows';
$workflowFiles = scandir($workflowDirectory);
$workflowFiles = array_filter($workflowFiles, fn ($file) => str_ends_with($file, '.yml'));

$workflowTimes = [];
foreach ($workflowFiles as $workflowFile) {
    $workflowContents = file_get_contents($workflowDirectory . '/' . $workflowFile);
    $randomHour = rand(0, 23);
    $randomMinute = rand(0, 59);
    $randomDayOfWeek = rand(0, 6);
    $workflowContents = preg_replace('/- cron: "\d+ \d+ \* \* \d+"/', '- cron: "' . $randomMinute . ' ' . $randomHour . ' * * ' . $randomDayOfWeek . '"', $workflowContents, 1, $count);
    if ($count !== 1) {
        throw new Exception('Failed to replace cron in ' . $workflowFile);
    }
    file_put_contents($workflowDirectory . '/' . $workflowFile, $workflowContents);
}
