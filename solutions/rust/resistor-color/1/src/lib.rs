use std::fmt::{Display, Formatter};
use enum_iterator;
use enum_iterator::{Sequence};

#[derive(Debug, PartialEq, Eq, Sequence)]
pub enum ResistorColor {
    Black = 0,
    Brown,
    Red,
    Orange,
    Yellow,
    Green,
    Blue,
    Violet,
    Grey,
    White,
}

impl TryFrom<u32> for ResistorColor {

    type Error = ();

    fn try_from(value: u32) -> Result<Self, Self::Error> {
        match value {
            0 => Ok(Self::Black),
            1 => Ok(Self::Brown),
            2 => Ok(Self::Red),
            3 => Ok(Self::Orange),
            4 => Ok(Self::Yellow),
            5 => Ok(Self::Green),
            6 => Ok(Self::Blue),
            7 => Ok(Self::Violet),
            8 => Ok(Self::Grey),
            9 => Ok(Self::White),
            _ => Err(())
        }
    }
}

impl Display for ResistorColor {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        f.write_str(&format!("{:?}", self))
    }
}

pub fn color_to_value(color: ResistorColor) -> u32 {
    color as u32
}

pub fn value_to_color_string(value: u32) -> String {
    match ResistorColor::try_from(value) {
        Ok(r) => {r.to_string() }
        Err(_) => { "value out of range".to_owned() }
    }
}

pub fn colors() -> Vec<ResistorColor> {
    enum_iterator::all::<ResistorColor>().collect()
}
