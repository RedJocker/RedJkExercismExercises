module ProteinTranslation
  def self.proteins(strand : String) : Array(String)
    proteins = strand.scan(/.{1,3}/).map { |codon| 
      case codon.to_s
		when "AUG"
		    "Methionine"
		when "UUU", "UUC"
		    "Phenylalanine"
		when "UUA", "UUG"
		    "Leucine"
		when "UCU", "UCC", "UCA", "UCG"
		    "Serine"
		when "UAU", "UAC"
		    "Tyrosine"
		when "UGU", "UGC"
		    "Cysteine"
		when "UGG"
		    "Tryptophan"
		when "UAA", "UAG", "UGA"
		    "STOP"
        else
            "ERROR"
      end
    }.take_while { |protein| 
        protein != "STOP" 
    }
    proteins.each { |protein|
        if protein == "ERROR"
          raise ArgumentError.new "invalid codon"
        end  
    }
    proteins 
  end
end
