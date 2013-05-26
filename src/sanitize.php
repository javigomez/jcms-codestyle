<?php
// Set max error reporting
ini_set('display_errors', '1');
ini_set('error_reporting', E_ALL | E_STRICT);

// Array of report files
$reports = array(
	'administrator/components.xml',
	'administrator/includes.xml',
	'administrator/modules.xml',
	'components.xml',
	'includes.xml',
	'libraries.xml',
	'modules.xml',
	'plugins.xml'
);

// Update the status
fwrite(STDOUT, "Loading report files for sanitization\n");

foreach ($reports as $report)
{
	$path = dirname(__DIR__) . '/reports/' . $report;

	// Update the status
	fwrite(STDOUT, "Loading report $report\n");

	// Load in the report XML
	$xml = simplexml_load_file($path);

	// Sanitize the file path in the HTML files
	foreach ($xml->file as $file)
	{
		// Sanitize the system path.  This assumes the repo is checked out at a parallel level to the joomla-cms repo.
		$file->attributes()->name = str_replace(dirname(dirname(__DIR__)) . '/joomla-cms', '', $file->attributes()->name);
	}

	// Update the status
	fwrite(STDOUT, "Finished sanitizing the file path in $report\n");

	file_put_contents($path, $xml->asXML());

	// Update the status
	fwrite(STDOUT, "Sanitized report $report saved\n");
}

// Update the status
fwrite(STDOUT, "All PHPCS reports processed\n");

exit;
