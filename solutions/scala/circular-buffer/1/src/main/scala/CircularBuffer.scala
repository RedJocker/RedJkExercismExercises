class EmptyBufferException() extends Exception {}

class FullBufferException() extends Exception {}

class CircularBuffer(val capacity: Int) {

  var start: Int = 0
  var end: Int  = 0
  var list: Array[Option[Int]] = Array.fill(capacity)(Option.empty)

  def write(value: Int) = {
    if (this.isFull)
      throw FullBufferException()
    list(end) = Some(value)
    end = this.incCircular(end)
  }

  def read(): Int = {
    if (this.isEmpty)
      throw EmptyBufferException()
    val ret = list(start)
    list(start) = Option.empty
    start = incCircular(start)
    ret.get
  }

  def overwrite(value: Int) = {
    if (!isFull) {
      write(value)
    } else {
      list(end) = Some(value)
      start = incCircular(start)
      end = incCircular(end)
    } 
  }

  def clear() = {
    start = 0;
    end = 0
    list = Array.fill(capacity)(Option.empty)
  }

  def isFull = {
    list(end).isDefined
  }

  def isEmpty = {
    list(start).isEmpty
  }

  def incCircular(i: Int) = (i + 1) % capacity

  override def toString(): String = list.toString()
}

