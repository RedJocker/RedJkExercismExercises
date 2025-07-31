package InventoryManagement;

use v5.30.3;

sub create_inventory  {
	my ($items) = @_;
    my %inventory;
	foreach my $item ($items->@*) {
		$inventory{$item} = 0 if(!exists $inventory{$item});
		$inventory{$item}++;
	}
    return \%inventory;
}

sub add_items  {
	my ( $inventory, $items ) = @_;
	foreach my $item ($items->@*) {
		$inventory->{$item} = 0 if(!exists $inventory->{$item});
		$inventory->{$item}++;
	}
    return $inventory;
}

sub remove_items  {
	my ( $inventory, $items ) = @_;
	foreach my $item ($items->@*) {
		if(exists $inventory->{$item} && $inventory->{$item} > 0){
			$inventory->{$item}--;
		};
	}
    return $inventory;
}

sub delete_item  {
	my ( $inventory, $item ) = @_;
    delete $inventory->{$item};
    return $inventory;
}

1;
