class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {

    ArrayList<Integer> list;
    private Integer start = 0;
    private Integer end = 0;
    private Integer capacity;
    
    CircularBuffer(int capacity) {
        this.capacity = capacity
        this.clear()
    }

    def clear() {
        this.list = new ArrayList<>(Collections.nCopies(this.capacity, null))
	start = 0
	end = 0
    }

    def read() {
        if (this.isEmpty()) {
            throw new EmptyBufferException()
        }
        def ret = list[start]
        list[start] = null
        start = this.incCircular(start)
        ret
    }

    def write(int item) {
        if (this.isFull())
            throw new FullBufferException()
        list[end] = item
        end = this.incCircular(end)
        list
    }

    def overwrite(int item) {
        if (!this.isFull())
            return write(item)
        list[end] = item
        start = incCircular(start)
        end = incCircular(end)
        list
    }

    private boolean isFull() {
        list[end] != null
    }

    private boolean isEmpty() {
        list[start] == null
    }

    private int incCircular(int i) {
        (i + 1) % capacity 
    }

    String toString() {
        this.list.toString()
    }
}
