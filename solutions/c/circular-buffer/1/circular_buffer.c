#include "circular_buffer.h"

circular_buffer_t *new_circular_buffer(int capacity) {
    circular_buffer_t *buffer;
    errno = 0;
    buffer = malloc(sizeof(circular_buffer_t));
    buffer->buffer = malloc(capacity * sizeof(buffer_value_t));
    buffer->head = 0;
    buffer->size = 0;
    buffer->capacity = capacity;
    return buffer;
}

int16_t write(circular_buffer_t *buffer, buffer_value_t value) {
    if (buffer->size < buffer->capacity) {
        int i = (buffer->head + buffer->size) % buffer->capacity;
        buffer->buffer[i] = value;
        buffer->size++;
        return 0;
    }
    else {
        errno = 105;
        return 1;
    }
}

int16_t overwrite(circular_buffer_t *buffer, buffer_value_t value) {
    if (buffer->size < buffer->capacity) {
        int i = buffer->head + buffer->size % buffer->capacity;
        buffer->buffer[i] = value;
        buffer->size++;
        return 0;
    }
    else {
        buffer->buffer[buffer->head] = value;
        buffer->head = (buffer->head + 1) % buffer->capacity;
        return 0;
    }
}

int16_t read(circular_buffer_t *buffer, buffer_value_t *value) {
    if (buffer->size == 0) {
        errno = 61;
        return 1;
    }
    else {
        *value = buffer->buffer[buffer->head];
        buffer->head = (buffer->head + 1) % buffer->capacity;
        buffer->size--;
        return 0;
    }
}

void clear_buffer(circular_buffer_t *buffer) {
    buffer->size = 0;
}
void delete_buffer(circular_buffer_t *buffer) {
    free(buffer->buffer);
    free(buffer);
}
