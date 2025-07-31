using System;
using System.Collections.Generic;
using System.Linq;

public static class ProteinTranslation
{
    public static IEnumerable<T> ForEach<T>(this IEnumerable<T> source, Action<T> action)
    {
	foreach (var item in source)
	    action(item);
	return source;
    }
    public static string[] Proteins(string strand)
    {
	return  strand.Chunk(3)
	    .Select(chk => new string(chk))
	    .Select(str => str switch {
		"AUG" => "Methionine",
		"UUU" or "UUC" => "Phenylalanine",
		"UUA" or "UUG" => "Leucine",
		"UCU" or "UCC" or "UCA" or "UCG" => "Serine",
		"UAU" or "UAC" => "Tyrosine",
		"UGU" or "UGC" => "Cysteine",
		"UGG" => "Tryptophan",
		"UAA" or "UAG" or "UGA" => "STOP",
		_ => "ERROR"
            }).TakeWhile(str => !str.Equals("STOP"))
	    .ForEach((str) => {
	        if (str.Equals("Error"))
                    throw new Exception($"Invalid condon {str}");
	    }).ToArray();
    }
}
