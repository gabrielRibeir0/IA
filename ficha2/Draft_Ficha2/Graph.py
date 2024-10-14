# Classe grafo para representaçao de grafos,
import math
from queue import Queue

import networkx as nx  # biblioteca de tratamento de grafos necessária para desnhar graficamente o grafo
import matplotlib.pyplot as plt  # idem

from Node import Node


# Constructor
# Methods for adding edges
# Methods for removing edges
# Methods for searching a graph
# BFS, DFS, A*, Greedy





class Graph:
    def __init__(self, directed=False):
        self.m_nodes = []  
        self.m_directed = directed
        self.m_graph = {}  
        self.m_h = {}  

    #############
    #    escrever o grafo como string
    #############
    def __str__(self):
        out = ""
        for key in self.m_graph.keys():
            out = out + "node" + str(key) + ": " + str(self.m_graph[key]) + "\n"
        return out

    ################################
    #   encontrar nodo pelo nome
    ################################

    def get_node_by_name(self, name):
        search_node = Node(name)
        for node in self.m_nodes:
            if node == search_node:
                return node
          
        return None

    ##############################3
    #   imprimir arestas
    ############################333333

    def imprime_aresta(self):
        listaA = ""
        lista = self.m_graph.keys()
        for nodo in lista:
            for (nodo2, custo) in self.m_graph[nodo]:
                listaA = listaA + nodo + " ->" + nodo2 + " custo:" + str(custo) + "\n"
        return listaA

    ################
    #   adicionar   aresta no grafo
    ######################

    def add_edge(self, node1, node2, weight):
        n1 = Node(node1)
        n2 = Node(node2)
        if (n1 not in self.m_nodes):
            n1_id = len(self.m_nodes)  # numeração sequencial
            n1.setId(n1_id)
            self.m_nodes.append(n1)
            self.m_graph[node1] = []
        else:
            n1 = self.get_node_by_name(node1)

        if (n2 not in self.m_nodes):
            n2_id = len(self.m_nodes)  # numeração sequencial
            n2.setId(n2_id)
            self.m_nodes.append(n2)
            self.m_graph[node2] = []
        else:
            n2 = self.get_node_by_name(node2)

        self.m_graph[node1].append((node2, weight)) 

        if not self.m_directed:
            self.m_graph[node2].append((node1, weight))

    #############################
    # devolver nodos
    ##########################

    def getNodes(self):
        return self.m_nodes

    #######################
    #    devolver o custo de uma aresta
    ##############3

    def get_arc_cost(self, node1, node2):
        custoT = math.inf
        a = self.m_graph[node1]  # lista de arestas para aquele nodo
        for (nodo, custo) in a:
            if nodo == node2:
                custoT = custo

        return custoT

    ##############################
    #  dado um caminho calcula o seu custo
    ###############################

    def calcula_custo(self, caminho):
        # caminho é uma lista de nodos
        teste = caminho
        custo = 0
        i = 0
        while i + 1 < len(teste):
            custo = custo + self.get_arc_cost(teste[i], teste[i + 1])
            i = i + 1
        return custo

    ################################################################################
    #     procura DFS
    ####################################################################################
    def procura_DFS(self, start, end, path=[], visited=set()):
        path.append(start)
        visited.add(start)

        if start == end:
            custoTotal = self.calcula_custo(path)
            return (path, custoTotal)

        for (adjacente, peso) in self.m_graph[start]:
            if adjacente not in visited:
                resultado = self.procura_DFS(adjacente, end, path, visited)
                if resultado is not None:
                    return resultado
        path.pop()

        return None

    #####################################################
    # Procura BFS  -- TO DO
    ######################################################
    def procura_BFS(self, start, end):
        visited = set()
        queue = Queue()

        queue.put(start)
        visited.add(start)

        parent = dict()
        parent[start] = None

        path_found = False
        while not queue.empty() and not path_found:
            if start == end:
                path_found = True
            else:
                for (adjacente, peso) in self.m_graph[start]:
                    if adjacente not in visited:
                        queue.put(adjacente)
                        parent[adjacente] = start
                        visited.add(adjacente)
                start = queue.get()

        path = []
        while parent[end] != None:
            path.append(parent[end])
            end = parent[end]

        path.reverse()
        custo = self.calcula_custo(path)
        return (path, custo)

  
    ####################
    # funçãop  getneighbours, devolve vizinhos de um nó
    ##############################

    def getNeighbours(self, nodo):
        lista = []
        for (adjacente, peso) in self.m_graph[nodo]:
            lista.append((adjacente, peso))
        return lista

    ###########################
    # desenha grafo  modo grafico
    #########################

    def desenha(self):
        ##criar lista de vertices
        lista_v = self.m_nodes
        lista_a = []
        g = nx.Graph()
        for nodo in lista_v:
            n = nodo.getName()
            g.add_node(n)
            for (adjacente, peso) in self.m_graph[n]:
                lista = (n, adjacente)
                # lista_a.append(lista)
                g.add_edge(n, adjacente, weight=peso)

        pos = nx.spring_layout(g)
        nx.draw_networkx(g, pos, with_labels=True, font_weight='bold')
        labels = nx.get_edge_attributes(g, 'weight')
        nx.draw_networkx_edge_labels(g, pos, edge_labels=labels)

        plt.draw()
        plt.show()

    ####################################33
    #    add_heuristica   -> define heuristica para cada nodo 1 por defeito....
    ################################3

    def add_heuristica(self, n, estima):
        n1 = Node(n)
        if n1 in self.m_nodes:
            self.m_h[n] = estima



    ##########################################
    #    A* - To Do
    ##########################################
    def procura_aStar(self, inicio, fim):
        open_list = set([inicio])
        closed_list = set()

        parents = {}
        parents[inicio] = None

        custo_acumulado = {}
        custo_acumulado[inicio] = 0

        while len(open_list) > 0:
            melhor_nodo = None
            for nodo in open_list:
                if melhor_nodo is None or self.getH(nodo) + custo_acumulado[nodo] < self.getH(melhor_nodo) + custo_acumulado[melhor_nodo]:
                    melhor_nodo = nodo


            if melhor_nodo is None:
                #caminho não existe
                return None

            if melhor_nodo == fim:
                path = []
                while parents[fim] != None:
                    path.append(parents[fim])
                    fim = parents[fim]

                path.reverse()
                custo = self.calcula_custo(path)
                return (path, custo)
            else:
                for (adjacente, peso) in self.getNeighbours(melhor_nodo):
                    if adjacente not in closed_list and adjacente not in open_list:
                        open_list.add(adjacente)
                        parents[adjacente] = melhor_nodo
                        custo_acumulado[adjacente] = custo_acumulado[melhor_nodo] + peso
                    elif adjacente in open_list and custo_acumulado[melhor_nodo] + peso < custo_acumulado[adjacente]:
                        parents[adjacente] = melhor_nodo
                        custo_acumulado[adjacente] = custo_acumulado[melhor_nodo] + peso
                closed_list.add(melhor_nodo)
                open_list.remove(melhor_nodo)

        #caminho não existe
        return None
        

    ###################################3
    # devolve heuristica do nodo
    ####################################

    def getH(self, nodo):
        if nodo not in self.m_h.keys():
            return 1000
        else:
            return (self.m_h[nodo])


    ##########################################
    #   Greedy - To Do
    ##########################################
    def greedy(self, inicio, fim):
        open_list = set([inicio])
        closed_list = set()

        parents = {}
        parents[inicio] = None

        while len(open_list) > 0:
            melhor_nodo = None
            for nodo in open_list:
                if melhor_nodo is None or self.getH(nodo) < self.getH(melhor_nodo):
                    melhor_nodo = nodo


            if melhor_nodo is None:
                #caminho não existe
                return None

            if melhor_nodo == fim:
                path = []
                while parents[fim] != None:
                    path.append(parents[fim])
                    fim = parents[fim]

                path.reverse()
                custo = self.calcula_custo(path)
                return (path, custo)
            else:
                for (adjacente, peso) in self.getNeighbours(melhor_nodo):
                    if adjacente not in closed_list and adjacente not in open_list:
                        open_list.add(adjacente)
                        parents[adjacente] = melhor_nodo
                closed_list.add(melhor_nodo)
                open_list.remove(melhor_nodo)

        #caminho não existe
        return None