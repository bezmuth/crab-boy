pub struct Memory{
    pub memory : [u8; 65535]
}

impl Memory {
    pub fn new() -> Memory {
        Memory { memory : [0x00; 65535]}
    }
}