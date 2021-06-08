$images_dir = "./images"
$input_dir = "$images_dir/ZZSN_zdjecia"
$output_dirname = "outputs"
$output_dir = "$images_dir/$output_dirname"
$extension = ".jpg"
$max_size = 256
$iterations = 250
$initial_iterations = 500

$contentImages = Get-ChildItem $input_dir # | Where-Object { $_.Name -match "C(12)|(18).jpg" }
$styleImages = Get-ChildItem $input_dir # | Where-Object { $_.Name "S(06)|(07)|(11).jpg" }

If(!(test-path $output_dir))
{
  New-Item -ItemType Directory -Force -Path $output_dir
}

$weights = 0.0015

$contentImages | Foreach-Object {
  $content = $_.BaseName
  $styleImages | Foreach-Object {
    $style = $_.BaseName
    $weights | Foreach-Object{
      $weight = $_
      $weightName = $weight.ToString() -replace "^0.", "W"
      echo "content :$content, style: $style, weight: $weight"
      $command = "style_transfer ""$input_dir/$content$extension"" ""$input_dir/$style$extension"" -s $max_size -o ""$output_dir/$content$style$weightName$extension"" -i $iterations -ii $initial_iterations -cw $weight"
      $command
      Invoke-Expression $command
    }
  }
}