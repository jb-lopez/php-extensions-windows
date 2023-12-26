<?php

$workflowDirectory = __DIR__ . '/.github/workflows';
$workflowFiles = scandir($workflowDirectory);
$workflowFiles = array_filter($workflowFiles, fn ($file) => str_ends_with($file, '.yml'));

$workflowTimes = [];
foreach ($workflowFiles as $workflowFile) {
    $workflowContents = file_get_contents($workflowDirectory . '/' . $workflowFile);
    try {
        $randomHour = random_int(0, 23);
        $randomMinute = random_int(0, 59);
        $randomDayOfWeek = random_int(0, 6);
        $workflowContents = preg_replace('/- cron: "\d+ \d+ \* \* \d+"/', '- cron: "' . $randomMinute . ' ' . $randomHour . ' * * ' . $randomDayOfWeek . '"', $workflowContents, 1, $count);
        if ($count !== 1) {
            throw new \RuntimeException('Failed to replace cron in ' . $workflowFile);
        }
        file_put_contents($workflowDirectory . '/' . $workflowFile, $workflowContents);
    } catch (\Random\RandomException $e) {
        echo 'Failed to generate random number: ' . $e->getMessage() . PHP_EOL;
        exit(1);
    } catch (\RuntimeException $e) {
        echo $e->getMessage() . PHP_EOL;
        exit(1);
    }
}
