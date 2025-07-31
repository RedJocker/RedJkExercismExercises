const BASE_RATE: u32 = 221;

fn success_rate(speed: u8) -> f64 {
    match speed {
        0 => 0.0,
        1 ..= 4 => 1.0,
        5 ..= 8 => 0.9,
        9 ..= 10 => 0.77,
        _ => panic!("unsupported speed {}", speed)
    }
}

pub fn production_rate_per_hour(speed: u8) -> f64 {
    f64::from(speed) * f64::from(BASE_RATE) * success_rate(speed)
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    (production_rate_per_hour(speed) / 60.0).floor() as u32
}
