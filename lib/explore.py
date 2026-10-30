graph = {
    "A": ["B", "C"],
    "B": ["D"],
    "C": ["E"],
    "D": ["F"],
    "E": [],
    "F": [],
    "G": ["H"],
    "H": []
}
graph2 = {
    "A": ["B", "C"],
    "B": ["D"],
    "C": [],
    "D": ["A"]
}

# read graph from file
# adjecent matrix format
# eg A B C D
#    0 1 0 0
#    1 0 1 1
#    0 1 1 1
#    0 1 0 0
def construct_graph(filename:str) -> dict[str: list[str]]:
    g_dict = {}
    with open(filename, "r") as f:
        keys = f.readline().strip().split(" ")
        count = len(keys)
        row = 0
        for line in f:
            arr = line.strip().split(" ")
            i = 0
            row_key = keys[row]
            print(row_key, arr)
            neighbour_val = []
            while i < count:
                if arr[i] == "1":
                    print("neighbour")
                    key = keys[i]
                    neighbour_val.append(key)
                i += 1
            g_dict[row_key] = neighbour_val 
            row += 1
        return g_dict
            

from collections import deque
def bfs(graph, start):
    visited = {start}
    frontier = deque([start])
    while frontier:
        current = frontier.popleft()
        neighbour_list = graph[current]
        if current not in visited:
            visited.add(current)
        for i in neighbour_list:
            
            if i not in visited:
                frontier.append(i)
                #visited.add(current)
                print(frontier)
                print(current)

    print(visited)


def dfs(graph, current, visited):
    visited.add(current)

    for neighbour in graph[current]:
        if neighbour not in visited:
            dfs(graph, neighbour, visited)
    return visited

bfs(graph, "A")
visited = set()
result_set = dfs(graph2, "A", visited)
print(result_set)

from pathlib import Path

path = Path("~/Documents/graph_example.txt").expanduser()

g = construct_graph(path)
print(g)
